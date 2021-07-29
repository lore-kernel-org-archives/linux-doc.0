Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABC1C432BE
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 13:30:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9726660184
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 13:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237757AbhG2NaC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jul 2021 09:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237909AbhG2N3t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jul 2021 09:29:49 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A371C06179A
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 06:29:43 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id a13so7155470iol.5
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bBXyPJ40vnd5+ZL+pO0HFoMryAlBWbVuEp9ODsQ5M7w=;
        b=EnVStG7Qc+N8EwprDitqh437ErxSeOCwxq8TY6n+4LDoCgejmoBTUZUTghk/IvtJVm
         MlvGR8DJyaq9oJuWd/YdCXZgfkG8VZiCa6V23WGLHHR376EY+dUgwgB7mMFqUeSAfc3a
         l0pQob57wrOjjQTFmLNQUMdM17wNtW3FxCqC20BuqVHvOEf4VIcyCbAbeF+OHHlKRfO9
         Lzo0vg6R/mkyLtWqfpd5eg/K2Klx1sFXLMNhIeBojwlWZxgKZjTvJNt7C7XOGPGpw8Ti
         J7iEZDUNqbrF7ba5RdnoKvCWqzJtX2myInVdIsCDZQUZnmz5qdABql5jvDViXPphJL3z
         fWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bBXyPJ40vnd5+ZL+pO0HFoMryAlBWbVuEp9ODsQ5M7w=;
        b=j2Pfhj53DzOAbNXUxSRAfrhsnzUZSsxY3u9rx1PA+v7cdksFfiXaAzIZO0I7b2uC8h
         6c0W3mFl3GXFp3Y2xtKAviVbYUZL7P51a+vsr8wmLHjg0m88jsYViiibM/Lu0N6FYigZ
         F96mP39+C+5XHSqjmTFdiA9Y6VaLi9QARCLDhPwxh/zX77CPHS4i0kxR5Zp6YUNeIhff
         y7tK2VT6AdCGLENp+Dr3XcoubLp2+8Z24y3Fs7iM3H++1YgvcR1u+LAtm+ScDdbdoSZi
         60kgBciUAoCNIQCga8iNUQiRY7DjGwR0mx4Jhfx2qqeYwciVJYFVmusVq9utbWp69xGi
         r5XA==
X-Gm-Message-State: AOAM532yFfGX0Gq7VFJUoHQZTdez9rJQxkHIZTCQLhuyxZNY0dpqKTzm
        Lajj8728poYWAtpy0ySHR9He9ZgaaAvJ5zlQKnM=
X-Google-Smtp-Source: ABdhPJxlBMRwWM3fWlDmmQmI3x92fNywbtNX79vqaRy2/VLkzeZ2G47Sa3HD9OeC9RF9p7Vj6mzPfRSUP2kxrC6PbCI=
X-Received: by 2002:a5e:9743:: with SMTP id h3mr4334816ioq.52.1627565383032;
 Thu, 29 Jul 2021 06:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627007852.git.siyanteng@loongson.cn> <59a6d091e35a486cec6148b3c842d3af4e7d1b86.1627007853.git.siyanteng@loongson.cn>
In-Reply-To: <59a6d091e35a486cec6148b3c842d3af4e7d1b86.1627007853.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 29 Jul 2021 21:29:06 +0800
Message-ID: <CAJy-Amme464Wmpe65f6Dsax9QiBnGRRojpoc+w-7wef+xt2hGw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] docs/zh_CN: add virt ne_overview translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn, chris.chenfeiyang@gmail.com,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gRnJpLCBKdWwgMjMsIDIwMjEgYXQgMTA6NDUgQU0gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxv
b25nc29uLmNuPiB3cm90ZToNCj4NCj4gVHJhbnNsYXRlIERvY3VtZW50YXRpb24vdmlydC9uZV9v
dmVydmlldy5yc3QgaW50byBDaGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNp
IDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQoNClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNA
a2VybmVsLm9yZz4NCg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9pbmRl
eC5yc3QgICAgICAgICB8ICAyICstDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvbmVf
b3ZlcnZpZXcucnN0ICAgfCA4OCArKysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDg5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L25lX292ZXJ2aWV3LnJzdA0K
Pg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9p
bmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2luZGV4LnJz
dA0KPiBpbmRleCAxYzYwMmI4NjM4ZjUuLmE3MWU5YTQzNTVjYyAxMDA2NDQNCj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9pbmRleC5yc3QNCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9pbmRleC5yc3QNCj4gQEAgLTIyLDEy
ICsyMiwxMiBAQCBMaW51eOiZmuaLn+WMluaUr+aMgQ0KPg0KPiAgICAgcGFyYXZpcnRfb3BzDQo+
ICAgICBndWVzdC1oYWx0LXBvbGxpbmcNCj4gKyAgIG5lX292ZXJ2aWV3DQo+DQo+ICBUT0RPTElT
VDoNCj4NCj4gICAgIGt2bS9pbmRleA0KPiAgICAgdW1sL3VzZXJfbW9kZV9saW51eF9ob3d0b192
Mg0KPiAtICAgbmVfb3ZlcnZpZXcNCj4gICAgIGFjcm4vaW5kZXgNCj4NCj4gIC4uIG9ubHk6OiBo
dG1sIGFuZCBzdWJwcm9qZWN0DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi92aXJ0L25lX292ZXJ2aWV3LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL3ZpcnQvbmVfb3ZlcnZpZXcucnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
IGluZGV4IDAwMDAwMDAwMDAwMC4uNmQzYWQzM2RlODg5DQo+IC0tLSAvZGV2L251bGwNCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9uZV9vdmVydmlldy5yc3QN
Cj4gQEAgLTAsMCArMSw4OCBAQA0KPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjANCj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3Jp
Z2luYWw6IERvY3VtZW50YXRpb24vdmlydC9uZV9vdmVydmlldy5yc3QNCj4gKw0KPiArOue/u+iv
kToNCj4gKw0KPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+
DQo+ICsNCj4gKzrmoKHor5E6DQo+ICsNCj4gKw0KPiArDQo+ICsuLiBfY25fdmlydF9uZV9vdmVy
dmlldzoNCj4gKw0KPiArPT09PT09PT09PT09PT0NCj4gK05pdHJvIEVuY2xhdmVzDQo+ICs9PT09
PT09PT09PT09PQ0KPiArDQo+ICvmpoLov7ANCj4gKz09PT0NCj4gKw0KPiArTml0cm8gRW5jbGF2
ZXPvvIhORe+8ieaYr+S6mumprOmAiuW8ueaAp+iuoeeul+S6ke+8iEVDMu+8ieeahOS4gOmhueaW
sOWKn+iDve+8jOWFgeiuuOWuouaIt+WcqEVDMuWung0KPiAr5L6L5Lit5YiS5YiG5Ye65a2k56uL
55qE6K6h566X546v5aKDWzFd44CCDQo+ICsNCj4gK+S+i+Wmgu+8jOS4gOS4quWkhOeQhuaVj+aE
n+aVsOaNruW5tuWcqOiZmuaLn+acuuS4rei/kOihjOeahOW6lOeUqOeoi+W6j++8jOWPr+S7peS4
juWcqOWQjOS4gOiZmuaLn+acuuS4rei/kOihjOeahA0KPiAr5YW25LuW5bqU55So56iL5bqP5YiG
5byA44CC54S25ZCO77yM6L+Z5Liq5bqU55So56iL5bqP5Zyo5LiA5Liq54us56uL5LqO5Li76Jma
5ouf5py655qE6Jma5ouf5py65Lit6L+Q6KGM77yM5Y2zDQo+ICtlbmNsYXZl44CCDQo+ICsNCj4g
K+S4gOS4qmVuY2xhdmXkuI7lgqznlJ/lroPnmoTomZrmi5/mnLrkuIDotbfov5DooYzjgILov5nn
p43orr7nva7nrKblkIjkvY7lu7bov5/lupTnlKjnmoTpnIDopoHjgILkuLplbmNsYXZlDQo+ICvl
iIbphY3nmoTotYTmupDvvIzlpoLlhoXlrZjlkoxDUFXvvIzmmK/ku47kuLvomZrmi5/mnLrkuK3l
iIblibLlh7rmnaXnmoTjgILmr4/kuKplbmNsYXZl6YO96KKr5pig5bCE5Yiw5LiADQo+ICvkuKro
v5DooYzlnKjkuLvomZrmi5/mnLrkuK3nmoTov5vnqIvvvIzor6Xov5vnqIvpgJrov4fkuIDkuKpp
b2N0bOaOpeWPo+S4jk5F6amx5Yqo6L+b6KGM6YCa5L+h44CCDQo+ICsNCj4gK+WcqOi/meS4quaE
j+S5ieS4iu+8jOacieS4pOS4que7hOaIkOmDqOWIhuOAgg0KPiArDQo+ICsxLiDkuIDkuKplbmNs
YXZl5oq96LGh6L+b56iL4oCU4oCU5LiA5Liq6L+Q6KGM5Zyo5Li76Jma5ouf5py65a6i5L2T5Lit
55qE55So5oi356m66Ze06L+b56iL77yM5a6D5L2/55SoTkXpqbHliqgNCj4gK+aPkOS+m+eahGlv
Y3Rs5o6l5Y+j5p2l55Sf5oiQ5LiA5LiqZW5jbGF2ZeiZmuaLn+acuu+8iOi/meWwseaYr+S4i+md
oueahDLvvInjgIINCj4gKw0KPiAr5pyJ5LiA5LiqTkXmqKHmi5/nmoRQQ0norr7lpIfmmrTpnLLn
u5nkuLvomZrmi5/mnLrjgILov5nkuKrmlrDnmoRQQ0norr7lpIfnmoTpqbHliqjooqvljIXlkKvl
nKhORempseWKqOS4reOAgg0KPiArDQo+ICtpb2N0bOmAu+i+keiiq+aYoOWwhOWIsFBDSeiuvuWk
h+WRveS7pO+8jOS+i+Wmgu+8jE5FX1NUQVJUX0VOQ0xBVkUgaW9jdGzmmKDlsITliLDkuIDkuKpl
bmNsYXZlDQo+ICvlkK/liqhQQ0nlkb3ku6TjgILnhLblkI7vvIxQQ0norr7lpIflkb3ku6Tooqvn
v7vor5HmiJDlnKjnrqHnkIbnqIvluo/mlrnpnaLph4flj5bnmoTooYzliqjvvJvkuZ/lsLHmmK/l
nKjov5ANCj4gK+ihjOS4u+iZmuaLn+acuueahOS4u+acuuS4iui/kOihjOeahE5pdHJv566h55CG
56iL5bqP44CCTml0cm/nrqHnkIbnqIvluo/mmK/ln7rkuo5LVk3moLjlv4PmioDmnK/nmoTjgIIN
Cj4gKw0KPiArMi4gZW5jbGF2ZeacrOi6q+KAlOKAlOS4gOS4qui/kOihjOWcqOS4juWCrOeUn+Wu
g+eahOS4u+iZmuaLn+acuuebuOWQjOeahOS4u+acuuS4iueahOiZmuaLn+acuuOAguWGheWtmOWS
jENQVQ0KPiAr5LuO5Li76Jma5ouf5py65Lit5YiG5Ymy5Ye65p2l77yM5LiT6Zeo55So5LqOZW5j
bGF2ZeiZmuaLn+acuuOAgmVuY2xhdmXmsqHmnInov57mjqXmjIHkuYXmgKflrZjlgqjjgIINCj4g
Kw0KPiAr5LuO5Li76Jma5ouf5py65Lit5YiG5Ymy5Ye65p2l5bm257uZZW5jbGF2ZeeahOWGheWt
mOWMuuWfn+mcgOimgeWvuem9kDIgTWlCLzEgR2lC54mp55CG6L+e57ut55qE5YaF5a2YDQo+ICvl
jLrln5/vvIjmiJbov5nkuKrlpKflsI/nmoTlgI3mlbDvvIzlpoI4IE1pQu+8ieOAguivpeWGheWt
mOWPr+S7pemAmui/h+S9v+eUqGh1Z2V0bGJmc+S7jueUqOaIt+epuumXtOWIhg0KPiAr6YWNWzJd
WzNd44CC5LiA5LiqZW5jbGF2ZeeahOWGheWtmOWkp+Wwj+mcgOimgeiHs+WwkTY0IE1pQuOAgmVu
Y2xhdmXlhoXlrZjlkoxDUFXpnIDopoHmnaXoh6rlkIwNCj4gK+S4gOS4qk5VTUHoioLngrnjgIIN
Cj4gKw0KPiAr5LiA5LiqZW5jbGF2ZeWcqOS4k+eUqOeahOaguOW/g+S4iui/kOihjOOAgkNQVSAw
5Y+K5YW25ZCM57qn5Yir55qEQ1BV6ZyA6KaB5L+d5oyB5a+55Li76Jma5ouf5py655qE5Y+v55So
DQo+ICvmgKfjgIJDUFXmsaDlv4XpobvnlLHlhbfmnInnrqHnkIbog73lipvnmoTnlKjmiLfkuLpO
ReebrueahOi/m+ihjOiuvue9ruOAguWFs+S6jkNQVeaxoOeahOagvOW8j++8jOivt+eci+WGheag
uA0KPiAr5paH5qGjWzRd5Lit55qEY3B1IGxpc3Tpg6jliIbjgIINCj4gKw0KPiArZW5jbGF2ZemA
mui/h+acrOWcsOmAmuS/oemAmumBk+S4juS4u+iZmuaLn+acuui/m+ihjOmAmuS/oe+8jOS9v+eU
qHZpcnRpby12c29ja1s1XeOAguS4u+iZmuaLn+acuuaciQ0KPiArdmlydGlvLXBjaSB2c29ja+ao
oeaLn+iuvuWkh++8jOiAjOmjnuWcsOiZmuaLn+acuuaciXZpcnRpby1tbWlvIHZzb2Nr5qih5ouf
6K6+5aSH44CCdnNvY2sNCj4gK+iuvuWkh+S9v+eUqGV2ZW50ZmTkvZzkuLrkv6Hku6TjgIJlbmNs
YXZl6Jma5ouf5py655yL5Yiw6YCa5bi455qE5o6l5Y+j4oCU4oCU5pys5ZywQVBJQ+WSjElPQVBJ
Q+KAlOKAlOS7jg0KPiArdmlydGlvLXZzb2Nr6K6+5aSH6I635b6X5Lit5pat44CCdmlydGlvLW1t
aW/orr7lpIfooqvmlL7nva7lnKjlhbjlnovnmoQ0IEdpQuS7peS4i+eahOWGheWtmOS4reOAgg0K
PiArDQo+ICvlnKhlbmNsYXZl5Lit6L+Q6KGM55qE5bqU55So56iL5bqP6ZyA6KaB5ZKM5bCG5Zyo
ZW5jbGF2ZeiZmuaLn+acuuS4rei/kOihjOeahOaTjeS9nOezu+e7n++8iOWmguWGheaguOOAgQ0K
PiArcmFtZGlza+OAgWluaXTvvInkuIDotbfooqvmiZPljIXliLBlbmNsYXZl6ZWc5YOP5Lit44CC
ZW5jbGF2ZeiZmuaLn+acuuacieiHquW3seeahOWGheaguOW5tumBteW+quaghw0KPiAr5YeG55qE
TGludXjlkK/liqjljY/orq5bNl3jgIINCj4gKw0KPiAr5YaF5qC4YnpJbWFnZeOAgeWGheaguOWR
veS7pOihjOOAgXJhbWRpc2vvvIhz77yJ5pivZW5jbGF2ZemVnOWDj+agvOW8j++8iEVJRu+8ieea
hOS4gOmDqOWIhu+8m+WPpuWklg0KPiAr6L+Y5pyJ5LiA5LiqRUlG5aS077yM5YyF5ous5YWD5pWw
5o2u77yM5aaCbWFnaWMgbnVtYmVy44CBZWlm54mI5pys44CB6ZWc5YOP5aSn5bCP5ZKMQ1JD44CC
DQo+ICsNCj4gK+WTiOW4jOWAvOaYr+S4uuaVtOS4qmVuY2xhdmXplZzlg4/vvIhFSUbvvInjgIHl
hoXmoLjlkoxyYW1kaXNr77yIc++8ieiuoeeul+eahOOAguS+i+Wmgu+8jOi/meiiq+eUqOadpeaj
gA0KPiAr5p+l5ZyoZW5jbGF2ZeiZmuaLn+acuuS4reWKoOi9veeahGVuY2xhdmXplZzlg4/mmK/l
kKbmmK/miZPnrpfov5DooYznmoTpgqPkuKrjgIINCj4gKw0KPiAr6L+Z5Lqb5Yqg5a+G5rWL6YeP
5YyF5ous5Zyo55SxTml0cm/nrqHnkIblubPlj7DmiJDnmoTnrb7lkI3or4HmmI7mlofku7bkuK3v
vIzlubbov5vkuIDmraXnlKjmnaXor4HmmI5lbmNsYXZlDQo+ICvnmoTouqvku73vvJtLTVPmmK9O
RembhuaIkOeahOacjeWKoeeahOS4gOS4quS+i+WtkO+8jOWug+ajgOafpeivgeaYjuaWh+S7tuOA
gg0KPiArDQo+ICtlbmNsYXZl6ZWc5YOP77yIRUlG77yJ6KKr5Yqg6L295YiwZW5jbGF2ZeWGheWt
mOS4re+8jOWBj+enu+mHj+S4ujggTWlC44CCZW5jbGF2ZeS4reeahOWIneWni+i/m+eoiw0KPiAr
6L+e5o6l5Yiw5Li76Jma5ouf5py655qEdnNvY2sgQ0lE5ZKM5LiA5Liq6aKE5a6a5LmJ55qE56uv
5Y+jLS05MDAw77yM5Lul5Y+R6YCB5LiA5Liq5b+D6Lez5YC8LS0weGI344CC6L+ZDQo+ICvkuKrm
nLrliLbnlKjkuo7lnKjkuLvomZrmi5/mnLrkuK3mo4Dmn6VlbmNsYXZl5piv5ZCm5bey57uP5ZCv
5Yqo44CC5Li76Jma5ouf5py655qEQ0lE5pivM+OAgg0KPiArDQo+ICvlpoLmnpxlbmNsYXZl6Jma
5ouf5py65bSp5rqD5oiW5LyY6ZuF5Zyw6YCA5Ye677yMTkXpqbHliqjkvJrmlLbliLDkuIDkuKrk
uK3mlq3kuovku7bjgILov5nkuKrkuovku7bkvJrpgJrov4fova7or6INCj4gK+mAmuefpeacuuWI
tui/m+S4gOatpeWPkemAgeWIsOi/kOihjOWcqOS4u+iZmuaLn+acuuS4reeahOeUqOaIt+epuumX
tGVuY2xhdmXov5vnqIvjgILnhLblkI7vvIznlKjmiLfnqbrpl7RlbmNsYXZlDQo+ICvov5vnqIvl
sLHlj6/ku6XpgIDlh7rkuobjgIINCj4gKw0KPiArWzFdIGh0dHBzOi8vYXdzLmFtYXpvbi5jb20v
ZWMyL25pdHJvL25pdHJvLWVuY2xhdmVzLw0KPiArWzJdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
ZG9jL2h0bWwvbGF0ZXN0L2FkbWluLWd1aWRlL21tL2h1Z2V0bGJwYWdlLmh0bWwNCj4gK1szXSBo
dHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvODA3MTA4Lw0KPiArWzRdIGh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLmh0bWwN
Cj4gK1s1XSBodHRwczovL21hbjcub3JnL2xpbnV4L21hbi1wYWdlcy9tYW43L3Zzb2NrLjcuaHRt
bA0KPiArWzZdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3g4Ni9ib290
Lmh0bWwNCj4gLS0NCj4gMi4yNy4wDQo+DQo=
