package org.intellij.sdk.language;

import com.intellij.lexer.Lexer;
import com.intellij.openapi.editor.DefaultLanguageHighlighterColors;
import com.intellij.openapi.editor.colors.TextAttributesKey;
import com.intellij.openapi.fileTypes.SyntaxHighlighterBase;
import com.intellij.psi.tree.IElementType;
import org.intellij.sdk.language.psi.SppTokenSets;
import org.intellij.sdk.language.psi.SppTypes;
import org.jetbrains.annotations.NotNull;


public class SppSyntaxHighlighter extends SyntaxHighlighterBase {
    public static final TextAttributesKey KEYWORD = TextAttributesKey.createTextAttributesKey("Keywords", DefaultLanguageHighlighterColors.KEYWORD);

    private static final TextAttributesKey[] KEYWORD_KEYS = new TextAttributesKey[]{KEYWORD};
    private static final TextAttributesKey[] EMPTY_KEYS = new TextAttributesKey[0];

    @Override
    public @NotNull Lexer getHighlightingLexer() {
        return new SppLexerAdapter();
    }

    @Override
    public TextAttributesKey @NotNull [] getTokenHighlights(IElementType tokenType) {
        if (SppTokenSets.KEYWORDS.contains(tokenType)) {
            return KEYWORD_KEYS;
        }
        return EMPTY_KEYS;
    }
}
