Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA3BC4743C
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 03:28:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07FE76113B
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 03:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhFWDbP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Jun 2021 23:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhFWDbO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jun 2021 23:31:14 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC04C061574
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 20:28:57 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id t9so591112pgn.4
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 20:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tqI0aAVJRfCTkdCM0aoSFWQ+Cw6ZD4WFe3biqnX4j1g=;
        b=SN0cciCRpCvv/KFK83Gv4h3I8T+uGnsuxyfVB5GgXT0gmj6+BFRmQ5FnF2CoLdhjQ7
         BUNsRKq7N3SK8WFcUbZfRt8HYgYelhMqAWxCVTM2HQduCCFKGOfyKnUH7j6HRV1kIW2S
         4CkOj8bQ3k5qdb4nD05lkoEosJCyzsZ0gae/viYyXJBl+2shvPYxHQPJgzeO4AApwF2d
         EsW6WC1IQ7qcBUxltkF4/v4iUdKoIFxTO8ItxPldN50sb2XKdxT6CJ0QZbzNDe95+Gl0
         UtRq66RRG2c4t/WwO/qE/DtHv2C7jLEjZ76ZMtWeDL7J77pc1NUdrAlGRQ4XNjSXPNb4
         fdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tqI0aAVJRfCTkdCM0aoSFWQ+Cw6ZD4WFe3biqnX4j1g=;
        b=hx9FjMhyY/NqKS63BINR7/sTKKfRoidf2uMtHatAMIYd8fggekwDU0zptU05FW4Wg4
         GJfpFIMAbneV38QIJ+VEG12RJaXrse/d9a6JitSFk3o2SLL/gY/heU+YziUD0Blcayge
         kd4ry3VXIQrBPHRmFQx2P6/SEVPlTFlTdt1EvT7O6jEGIvMztQnrIRjHkZ+9B0BCe8ZX
         ij5zqP2af127RkvYHId0xqE2h7Kl07qphs+XSKUwMLb/JYBc9O9sdzCovvRizRW8KyXg
         oI6oDu8/ZHaeVS8eZD7kS7L0FRk7VnGX2Hcim++OArdiTo6l0u2fAbD+rIOtz6yhScCL
         QZaQ==
X-Gm-Message-State: AOAM533Vnd97TZqvrustIRgpj+TRGOQDhPfC7hvxH5jFkIckYnFtkf3y
        hCF1O7OqSpuD27sUQQfFXnaOgmk374y52uLzEtc=
X-Google-Smtp-Source: ABdhPJzG9pVS6S2+o8WeVEwuVHr6ZIW7cgq7/402JJmcfqcZsSIYBgnsq9Mym1DmOJfBHYVHWcAFcGRb9SMrV6TPyWg=
X-Received: by 2002:a05:6a00:16d2:b029:300:200b:6572 with SMTP id
 l18-20020a056a0016d2b0290300200b6572mr6830662pfc.62.1624418936456; Tue, 22
 Jun 2021 20:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624169811.git.bobwxc@email.cn> <3341764131722e5bac894fe5b5699bbaf07e2e8a.1624169811.git.bobwxc@email.cn>
In-Reply-To: <3341764131722e5bac894fe5b5699bbaf07e2e8a.1624169811.git.bobwxc@email.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Wed, 23 Jun 2021 11:28:46 +0800
Message-ID: <CAMU9jJrd05LsTtUJ8YgSP3XNYgwPjMVxfMS+6uYZGfwCCWqqnQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/zh_CN: Add translation zh_CN/admin-guide/efi-stub.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NuaciDIw5pel5ZGo5pel
IOS4i+WNiDY6NDHlhpnpgZPvvJoNCj4NCj4gQWRkIGEgbmV3IHRyYW5zbGF0aW9uDQo+ICAgRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvZWZpLXN0dWIucnN0DQo+
IGFuZCBsaW5rIGl0IHRvIHpoX0NOL2FkbWluLWd1aWRlL2luZGV4LnJzdA0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1haWwuY24+DQo+IC0tLQ0KPiAgLi4uL3po
X0NOL2FkbWluLWd1aWRlL2VmaS1zdHViLnJzdCAgICAgICAgICAgIHwgODYgKysrKysrKysrKysr
KysrKysrKw0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9pbmRleC5yc3Qg
IHwgIDIgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2FkbWluLWd1aWRlL2VmaS1zdHViLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvZWZpLXN0dWIucnN0IGIvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvZWZpLXN0dWIucnN0DQo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uYjZhNGNlZGVjOGViDQo+
IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
YWRtaW4tZ3VpZGUvZWZpLXN0dWIucnN0DQo+IEBAIC0wLDAgKzEsODYgQEANCj4gKy4uIGluY2x1
ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50
YXRpb24vYWRtaW4tZ3VpZGUvZWZpLXN0dWIucnN0DQo+ICsNCj4gKzror5HogIU6DQo+ICsNCj4g
KyDlkLTmg7PmiJAgV3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPg0KPiArDQo+ICs9PT09
PT09PT0NCj4gK0VGSeW8leWvvOahqQ0KPiArPT09PT09PT09DQo+ICsNCj4gK+WcqHg4NuWSjEFS
TeW5s+WPsOS4iu+8jOWGheaguHpJbWFnZS9iekltYWdl5Y+v5Lul5Lyq6KOF5oiQUEUvQ09GRuaY
oOWDj++8jOS7juiAjOS9v0VGSeWbuuS7tuWKoOi9vQ0KPiAr56iL5bqP5Yqg6L295YW25L2c5Li6
RUZJ5Y+v5omn6KGM5paH5Lu244CC5L+u5pS5YnpJbWFnZeWktOS7peWPiuWbuuS7tuWKoOi9veeo
i+W6j+i3s+i9rOeJueWumuWFpeWPo+eCueeahA0KaG93IGFib3V0Og0K5bCG5YW25L2c5Li6RUZJ
5Y+v5omn6KGM5paH5Lu25Yqg6L2977yfDQoNClRoYW5rcywNCg0KWWFudGVuZw0KPiAr5Luj56CB
6KKr57uf56ew5Li64oCcRUZJ5byV5a+85qGp77yIRUZJIEJvb3QgU3R1Yu+8ieKAne+8jOWIhuW4
g+WcqGFyY2gveDg2L2Jvb3QvaGVhZGVyLlPlkowNCj4gK2FyY2gveDg2L2Jvb3QvY29tcHJlc3Nl
ZC9lYm9vdC5j5Lit44CC5a+55LqOQVJN77yMRUZJ5qGp5ZyoYXJjaC9hcm0vYm9vdC9jb21wcmVz
c2VkL2VmaS1oZWFkZXIuUw0KPiAr5ZKMYXJjaC9hcm0vYm9vdC9jb21wcmVzc2VkL2VmaS1zdHVi
LmPkuK3lrp7njrDjgILkvZPns7vnu5PmnoTkuYvpl7TlhbHkuqvnmoRFRknmoanku6PnoIENCj4g
K+S9jeS6jmRyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWLkuK3jgIINCj4gKw0KPiAr6ICMYXJt
NjTmsqHmnInljovnvKnlhoXmoLjmlK/mjIHvvIzlm6DmraTmmKDlg4/mnKzouqvkvKroo4XmiJBQ
RS9DT0ZG5pig5YOP77yMRUZJ5qGp6ZO+5o6l5Yiw5YaF5qC444CCDQo+ICthcm02NCBFRknmoank
vY3kuo5hcmNoL2FybTY0L2tlcm5lbC9FRkkgZW50cnkuU+WSjGRyaXZlcnMvZmlybXdhcmUvZWZp
L2xpYnN0dWIvYXJtNjQtc3R1Yi5jDQo+ICvkuK3jgIINCj4gKw0KPiAr6YCa6L+H5L2/55SoRUZJ
5byV5a+85qGp77yM5Y+v5Lul5Zyo5LiN5L2/55So5Lyg57ufRUZJ5byV5a+85Yqg6L2956iL5bqP
55qE5oOF5Ya15LiL5byV5a+8TGludXjlhoXmoLjvvIwNCj4gK+WmgmdydWLmiJZlbGlsb+OAgueU
seS6jkVGSeW8leWvvOahqeaJp+ihjOS6huW8leWvvOWKoOi9veeoi+W6j+eahOW3peS9nO+8jOWb
oOatpOafkOenjeaEj+S5ieS4iuadpeivtA0KPiAr5a6DICrlsLHmmK8qIOW8leWvvOWKoOi9veeo
i+W6j+OAgg0KPiArDQo+ICtFRknlvJXlr7zmoanpgJrov4dDT05GSUdfRUZJX1NUVULlhoXmoLjp
gInpobnlkK/nlKjjgIINCj4gKw0KPiArDQo+ICvlpoLkvZXlronoo4ViekltYWdlLmVmaQ0KPiAr
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICvkvY3kuo5hcmNoL3g4Ni9ib290L2J6SW1hZ2Xk
uK3nmoRiekltYWdl5b+F6aG75aSN5Yi25YiwRUZJ57O757uf5YiG5Yy677yIRVNQ77yJ5bm25L+u
5pS55omp5bGV5ZCNDQo+ICvkuLrigJwuZWZp4oCd44CC5rKh5pyJ5omp5bGV5ZCN55qE6K+dRUZJ
5Zu65Lu25Yqg6L2956iL5bqP5bCG5ouS57ud5omn6KGM5a6D44CC5bCa5peg5rOV5LuO5pmu6YCa
55qETGludXjmlofku7YNCj4gK+ezu+e7n+S4reaJp+ihjGJ6SW1hZ2UuZWZp77yM5Zug5Li6RUZJ
5Zu65Lu25LiN5pSv5oyB6L+Z5Lqb5paH5Lu257O757uf44CCQVJN5bmz5Y+w6ZyA6KaB5bCGYXJj
aC9hcm0vYm9vdC96SW1hZ2UNCj4gK+WkjeWItuWIsOezu+e7n+WIhuWMuu+8jOW5tuWPr+iDveaX
oOmcgOmHjeWRveWQje+8m2FybTY05Lmf57G75Ly877yM6ZyA6KaB5aSN5Yi2YXJjaC9hcm02NC9i
b290L0ltYWdl77yMDQo+ICvkvYbkuI3kuIDlrpropoHph43lkb3lkI3jgIINCj4gKw0KPiArDQo+
ICvku45FRkkgc2hlbGzkvKDpgJLlhoXmoLjlj4LmlbANCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQo+ICsNCj4gK+WGheaguOWPguaVsOWPr+S6jmJ6SW1hZ2UuZWZp5LmL5ZCO5Lyg6YCS77yM
5L6L5aaCOjoNCj4gKw0KPiArICAgICAgIGZzMDo+IGJ6SW1hZ2UuZWZpIGNvbnNvbGU9dHR5UzAg
cm9vdD0vZGV2L3NkYTQNCj4gKw0KPiArDQo+ICvigJxpbml0cmQ94oCd6YCJ6aG5DQo+ICstLS0t
LS0tLS0tLS0tDQo+ICsNCj4gK+S4juWkp+WkmuaVsOW8leWvvOWKoOi9veeoi+W6j+S4gOagt++8
jEVGSeahqeWFgeiuuOeUqOaIt+S9v+eUqOKAnGluaXRyZD3igJ3pgInpobnmjIflrprlpJrkuKpp
bml0cmTmlofku7bjgIINCj4gK+i/meaYr+WUr+S4gOeahEVGSeahqeeJueauiueJueWRveS7pOih
jOWPguaVsO+8jOWFtuS7luaJgOacieWGheWuuemDveWcqOWwhuWGheaguOWQr+WKqOaXtuS8oOmA
kue7meWGheaguOOAgg0KPiArDQo+ICtpbml0cmTmlofku7bnmoTot6/lvoTlv4XpobvkuLrku45F
U1DlvIDlp4vnmoTnu53lr7not6/lvoTvvIznm7jlr7not6/lvoTml6Dms5Xkvb/nlKjjgILlkIzm
l7bmraTot6/lvoTkuLpFRkkNCj4gK+mjjuagvO+8jOebruW9leWFg+e0oOW/hemhu+eUqOWPjeaW
nOadoO+8iFzvvInliIbpmpTjgILkvovlpoLnu5nlrprku6XkuIvnm67lvZXluIPlsYA6Og0KPiAr
DQo+ICsgIGZzMDo+DQo+ICsgICAgICAgS2VybmVsc1wNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgYnpJbWFnZS5lZmkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaW5pdHJkLWxhcmdlLmlt
Zw0KPiArDQo+ICsgICAgICAgUmFtZGlza3NcDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlu
aXRyZC1zbWFsbC5pbWcNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaW5pdHJkLW1lZGl1bS5p
bWcNCj4gKw0KPiAr546w5bel5L2c55uu5b2V5Li6ZnMwOlxLZXJuZWxz77yM6KaB5L2/55SoaW5p
dHJkLWxhcmdlLmltZ+aWh+S7tuW8leWvvO+8jOWImemhu+S9v+eUqOS7peS4i+WRveS7pDo6DQo+
ICsNCj4gKyAgICAgICBmczA6XEtlcm5lbHM+IGJ6SW1hZ2UuZWZpIGluaXRyZD1cS2VybmVsc1xp
bml0cmQtbGFyZ2UuaW1nDQo+ICsNCj4gK+ivt+azqOaEj2J6SW1hZ2UuZWZp5piv5oCO5qC35Y+v
55So55u45a+56Lev5b6E5oyH5a6a55qE44CC6YKj5piv5Zug5Li65oiR5Lus5omn6KGM55qE5pig
5YOP5piv55SxRUZJIHNoZWxsDQo+ICvop6Pph4rnmoTvvIzlroPlj6/op6PmnpDnm7jlr7not6/l
voTvvIzogIzlkb3ku6TooYznmoTlhbbkvZnpg6jliIbliJnkvKDpgJLnu5liekltYWdlLmVmaeOA
gg0KPiArDQo+ICsNCj4gK+KAnGR0Yj3igJ3pgInpobkNCj4gKy0tLS0tLS0tLS0NCj4gKw0KPiAr
5a+55LqOQVJN5ZKMYXJtNjTkvZPns7vnu5PmnoTvvIzlv4XpobvkuLrlhoXmoLjmj5DkvpvkuIDk
uKrorr7lpIfmoJHjgILpgJrluLjlm7rku7blupTpgJrov4dFRkkgQ09ORklHVVJBVElPTg0KPiAr
VEFCTEXvvIhFRknphY3nva7ooajvvInmnaXmlK/mjIHorr7lpIfmoJHjgILkvYbmmK/igJxkdGI9
4oCd5ZG95Luk6KGM6YCJ6aG55Y+v5Lul55So5LqO6KaG55uW5Zu65Lu25o+Q5L6b55qE6K6+5aSH
DQo+ICvmoJHvvIzmiJblnKjlm7rku7bml6Dms5Xmj5Dkvpvml7bmnaXmj5DkvpvkuIDkuKrorr7l
pIfmoJHjgIINCj4gKw0KPiAr6K+35rOo5oSP77ya5Zu65Lu25bCG5Zyo5ZCv5Yqo5YaF5qC45LmL
5YmN5bCG6L+Q6KGM5pe26YWN572u5L+h5oGv5re75Yqg5Yiw6K6+5aSH5qCR44CC5aaC5p6cIGBg
ZHRiPWBgIOiiq+eUqOadpQ0KPiAr6KaG55uW6K6+5aSH5qCR77yM5YiZ5Zu65Lu25o+Q5L6b55qE
5Lu75L2V6L+Q6KGM5pe25pWw5o2u6YO95bCG5Lii5aSx44CCIGBgZHRiPWBgIOmAiemhueW6lOWP
queUqOS9nOiwg+ivleW3peWFt++8jA0KPiAr5oiW6ICF5ZyoRUZJIENPTkZJR1VSQVRJT04gVEFC
TEXkuK3mnKrmj5Dkvpvorr7lpIfmoJHml7bkvZzkuLrmnIDlkI7nmoTmiYvmrrXjgIINCj4gKw0K
PiAr4oCcZHRiPeKAneeahOWkhOeQhuaWueW8j+S4juS4iui/sOKAnGluaXRyZD3igJ3pgInpobnn
m7jlkIzjgIINCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L2FkbWluLWd1aWRlL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L2FkbWluLWd1aWRlL2luZGV4LnJzdA0KPiBpbmRleCA0NjAwMzRjYmMyYWIuLmQ3NGY1ZTg2NDg5
OCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4t
Z3VpZGUvaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L2FkbWluLWd1aWRlL2luZGV4LnJzdA0KPiBAQCAtNjUsNiArNjUsNyBAQCBUb2RvbGlzdDoNCj4N
Cj4gICAgIGNsZWFyaW5nLXdhcm4tb25jZQ0KPiAgICAgY3B1LWxvYWQNCj4gKyAgIGVmaS1zdHVi
DQo+ICAgICBsb2NrdXAtd2F0Y2hkb2dzDQo+ICAgICB1bmljb2RlDQo+DQo+IEBAIC04Nyw3ICs4
OCw2IEBAIFRvZG9saXN0Og0KPiAgICAgZGVsbF9yYnUNCj4gICAgIGRldmljZS1tYXBwZXIvaW5k
ZXgNCj4gICAgIGVkaWQNCj4gLSAgIGVmaS1zdHViDQo+ICAgICBleHQ0DQo+ICAgICBuZnMvaW5k
ZXgNCj4gICAgIGdwaW8vaW5kZXgNCj4gLS0NCj4gMi4yMC4xDQo+DQo=
