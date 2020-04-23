package com.hryen.blog.util;

import com.vladsch.flexmark.ext.autolink.AutolinkExtension;
import com.vladsch.flexmark.ext.emoji.EmojiExtension;
import com.vladsch.flexmark.ext.emoji.EmojiImageType;
import com.vladsch.flexmark.ext.gfm.strikethrough.StrikethroughExtension;
import com.vladsch.flexmark.ext.gfm.tasklist.TaskListExtension;
import com.vladsch.flexmark.ext.ins.InsExtension;
import com.vladsch.flexmark.ext.tables.TablesExtension;
import com.vladsch.flexmark.ext.toc.TocExtension;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.ast.Node;
import com.vladsch.flexmark.util.data.MutableDataSet;

import java.util.Arrays;

public class MarkdownUtils {

    private static final MutableDataSet OPTIONS = new MutableDataSet()
            .set(EmojiExtension.USE_IMAGE_TYPE, EmojiImageType.UNICODE_ONLY)
            .set(Parser.EXTENSIONS, Arrays.asList(
                    AutolinkExtension.create(),
                    EmojiExtension.create(),
                    InsExtension.create(),
                    StrikethroughExtension.create(),
                    TablesExtension.create(),
                    TaskListExtension.create(),
                    TocExtension.create()));

    private static final Parser PARSER = Parser.builder(OPTIONS).build();

    private static final HtmlRenderer RENDERER = HtmlRenderer.builder(OPTIONS).build();

    public static String renderHtml(String markdown) {
        Node document = PARSER.parse(markdown);
        return RENDERER.render(document);
    }

}
