Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA29C433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 03:31:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4180F6128D
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 03:31:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbhDGDbH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 23:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234254AbhDGDbG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 23:31:06 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80F1C06174A
        for <linux-doc@vger.kernel.org>; Tue,  6 Apr 2021 20:30:54 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id c16so17404236oib.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Apr 2021 20:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=to1j7vqcA1+VUKoaOw4nGfhrzL1Ziy48gxItT1t1Ul8=;
        b=eRw9Q5MmmHjSGG6acNJD2gaEcP4IBfqHDpWqDkJfSxMNQjHcBO6SRFJjvF3v5JMIB3
         Af+cIkH6v+oHtHMkYYM0neIoN3jwvV0834/xwGB+wXaoLcVXHPl93PTRKR7wQl5QeEDq
         W/jlfqsjBXS7CKu/EVf6Gdf0qbC6Iorx5V3f93QU0K10QIYfTnVzivh2yTCFpxajKGLZ
         qaa4IQTm4rFsl1n5X4z6QfXl4EL6TmaqM9zWwJKHhJW7/gGfCJl1u5DJxJjTGTgHJFaP
         ZlVJC2YW20rLToQ1jYv3hilTTohoydQne1XTNcVOU3Wuj7Bc3MYToWdhAHup0umCZ4Wu
         TOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=to1j7vqcA1+VUKoaOw4nGfhrzL1Ziy48gxItT1t1Ul8=;
        b=ERnAn/jCiyHR0SDRO3A3K30UXlU1X/V48PTU5+SHuPaE+BvROi0N7uFf1mMa27fkg2
         qazWwHDRl/c35jqt0ToXVqNvc9BrQ4cXC4011DkjTmisjZTdJgkRmPtGfH5zlN40iCOD
         1by9TjbcN7+2lyupPpb/BTpGl/RzPBbz4f0wQdNoBfE/z0V7Q9zW4MFb8pSbcWZCzu2M
         hXCoS1xCLjWFtLvtCu3Zz09dJt/zqn5iCg2oYoBocGXIBBO2CLXHW6QqGVokJN/OtLuH
         9mFyRaCltFXo6aC0lxeAa3Q2xd3JDDm8MT3v+CABDy2lSUisWaJ8FsH5/tSnTGzDi1G6
         NdGw==
X-Gm-Message-State: AOAM532MoSatEE6wc8kkc6r16aouHe2DFdUiGyhZ9XEUO5qL3sBT5MH7
        94GXC1+r6Woyx53DI4Mjz2kyoa5TqPavFD9FZsY=
X-Google-Smtp-Source: ABdhPJxJmkqDcZ0z6RPq24WuluQoSGlUVQzvOnQcHHXePnO97M0oXkDLbvkKKw/LD1E+4rTsN8+W6fxvaJPTxLKy6Vw=
X-Received: by 2002:aca:4104:: with SMTP id o4mr790288oia.127.1617766254238;
 Tue, 06 Apr 2021 20:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-7-siyanteng@loongson.cn> <20210406163930.GA17278@bobwxc.top>
In-Reply-To: <20210406163930.GA17278@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 7 Apr 2021 11:30:44 +0800
Message-ID: <CAEensMz20X=Oj8qc5Rd6=iRT1CsmfWpF3jS74KQEXe4H4CEmrQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] docs/zh_CN: add core-api/index.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDfml6XlkajkuIkg5LiK5Y2I
MTI6MznlhpnpgZPvvJoNCj4NCj4gT24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMDk6MDI6MDVQTSAr
MDgwMCwgWWFudGVuZyBTaSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHRyYW5zbGF0ZXMgRG9jdW1l
bnRhdGlvbi9jb3JlLWFwaS9pbmRleC5yc3QgaW50byBDaGluZXNlLg0KPiA+IGFkZCBEb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pcnEvKiB0byB6aF9DTi9jb3JlLWFw
aS9pbmRleC5yc3QuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRl
bmdAbG9vbmdzb24uY24+DQo+ID4gLS0tDQo+ID4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vY29y
ZS1hcGkvaW5kZXgucnN0ICAgICB8IDEyNiArKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEyNiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pbmRleC5yc3QNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9p
bmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pbmRl
eC5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4u
MWQwZTczYjAzODU4DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2luZGV4LnJzdA0KPiA+IEBAIC0wLDAgKzEsMTI2
IEBADQo+ID4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+ICsNCj4g
PiArOk9yaWdpbmFsOiA6ZG9jOmAuLi8uLi8uLi9jb3JlLWFwaS9pcnEvaW5kZXhgDQo+ID4gKzpU
cmFuc2xhdG9yOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gKw0KPiA+
ICsuLiBfY25fY29yZS1hcGlfaW5kZXgucnN0Og0KPiA+ICsNCj4gPiArDQo+ID4gKz09PT09PT09
PT09PT09PT09PT09PT0NCj4gPiAr5qC45b+DQVBJ5paH5qGjDQo+ID4gKz09PT09PT09PT09PT09
PT09PT09PT0NCj4gPiArDQo+ID4gK+i/meaYr+aguOW/g+WGheaguEFQSeaJi+WGjOeahOW8gOer
r+OAgiDpnZ7luLjmhJ/osKLkuLrmnKzmiYvlhozovazmjaIo5ZKM57yW5YaZISnnmoTmlofmoaMh
DQo+DQo+IOaJi+WGjOeahOmmlumhtQ0KT0shDQpJdCdzIGJlZW4gY29uZnVzaW5nIG1lIGZvciBh
IGxvbmcgdGltZe+8jHRoYW5rIHlvdSB2ZXJ5IG11Y2jvvIENCj4NCj4gPiArDQo+ID4gK+aguOW/
g+WFrOeUqOeoi+W6jw0KPg0KPiDlrp7nlKjnqIvluo8NCj4NCj4g6KeE6IyD55So6K+NOiAgIOWu
nueUqOeoi+W6jw0KPiDoi7Hor63lkI06ICAgICAgICAgICAgdXRpbGl0eSBwcm9ncmFt77yMdXRp
bGl0eQ0KPiDlj7Dmub7lkI06ICAgICAgICAgICAg5YWs55So56iL5byP77yM5YWs55So5bi45byP
DQo+IOingei9vTogICAgICAgICAgICAg5rW35bOh5Lik5bK45L+h5oGv56eR5a2m5oqA5pyv5ZCN
6K+NDQo+IOWtpuenkTogICAgICAgICAgICAg5L+h5oGv56eR5a2m5oqA5pyvDQo+IOWFrOW4g+W5
tOW6pjogICAyMDA4DQo+DQpPSyENCj4gPiArPT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gK+ac
rOiKguaciemAmueUqOaWh+S7tuWSjCAi5qC45b+D5Lit55qE5qC45b+DIiDmlofku7bjgIIg56ys
5LiA6YOo5YiG5pivIGRvY2Jvb2sg5pe25pyf6YGX55WZ5LiLDQo+DQo+IOacrOiKguWMheWQq+mA
mueUqOeahOWSjOKAnOaguOW/g+S4reeahOaguOW/g+KAneaWh+aho+OAgg0KPg0KT0shDQo+ID4g
K+adpeeahOWkp+mHjyBrZXJuZWxkb2Mg5L+h5oGv77yb5pyJ5pyd5LiA5pel77yM5b2T5pyJ5Lq6
5om+5Yiw57K+5Yqb5Y675YGa55qE5pe25YCZ77yM55yf55qEDQo+ID4gK+W6lOivpeaKiuWug+aL
huWIhuWHuuadpeOAgg0KPg0KPiDoi6XmnInkurrkuYvlkI7mnInliqjlipvnmoTor53vvIzlupTl
vZPmiorlroPku6zmi4bliIblh7rmnaXjgIINCuKAneacieacneS4gOaXpeKAnCBjb25mbGljdHMg
d2l0aCDigJ3kuYvlkI7igJwNCmRlbCAi5LmL5ZCO4oCdDQpPS++8nw0KPg0KPiA+ICsNCj4gPiAr
VG9kb2xpc3Q6DQo+ID4gKw0KPiA+ICsgICBrZXJuZWwtYXBpDQo+ID4gKyAgIHdvcmtxdWV1ZQ0K
PiA+ICsgICBwcmludGstYmFzaWNzDQo+ID4gKyAgIHByaW50ay1mb3JtYXRzDQo+ID4gKyAgIHN5
bWJvbC1uYW1lc3BhY2VzDQo+ID4gKw0KPiA+ICvmlbDmja7nu5PmnoTlkozkvY7nuqflhaznlKjn
qIvluo8NCj4NCj4g5a6e55So56iL5bqPDQo+DQpPSyENCj4gPiArPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09DQo+ID4gKw0KPiA+ICvlnKjmlbTkuKrlhoXmoLjkuK3kvb/n
lKjnmoTlh73mlbDlupPjgIINCj4NCj4gbWlzc2luZyAnZnVuY3Rpb25hbGl0eScNCj4NCj4g5Yqf
6IO95Zyo5pW05Liq5YaF5qC45Lit6KKr5L2/55So55qE5Ye95pWw5bqT44CCDQo+DQpmdW5jdGlv
biAtPiDlh73mlbDvvIjljZXkuKrpu5HljKPlrZDvvIkNCmZ1bmN0aW9uYWxpdHkgLT4g5Ye95pWw
77yI57Sv56ev55qE6YKj56eN77yM5b6I5aSa5Liq6buR5Yyj5a2Q77yJDQpMaWJyYXJ5IC0+IOW6
kw0KPiA+ICsNCj4gPiArVG9kb2xpc3Q6DQo+ID4gKw0KPiA+ICsgICBrb2JqZWN0DQo+ID4gKyAg
IGtyZWYNCj4gPiArICAgYXNzb2NfYXJyYXkNCj4gPiArICAgeGFycmF5DQo+ID4gKyAgIGlkcg0K
PiA+ICsgICBjaXJjdWxhci1idWZmZXJzDQo+ID4gKyAgIHJidHJlZQ0KPiA+ICsgICBnZW5lcmlj
LXJhZGl4LXRyZWUNCj4gPiArICAgcGFja2luZw0KPiA+ICsgICBidXMtdmlydC1waHlzLW1hcHBp
bmcNCj4gPiArICAgdGhpc19jcHVfb3BzDQo+ID4gKyAgIHRpbWVrZWVwaW5nDQo+ID4gKyAgIGVy
cnNlcQ0KPiA+ICsNCj4gPiAr5bm25Y+R5Y6f6K+tDQo+ID4gKz09PT09PT09PT09PT09PT09PT09
PT0NCj4gPiArDQo+ID4gK0xpbnV45aaC5L2V6K6p5LiA5YiH5ZCM5pe25Y+R55Sf44CCIOivpuaD
heivt+WPgumYhQ0KPiA+ICs6ZG9jOmAvbG9ja2luZy9pbmRleGANCj4NCj4gSSdtIG5vdCBzdXJl
IGlmIHRoZSBwYXRoIHN1aXRhYmxlIGZvciB0YW5zbGF0aW9uIGRpcj8NCkkgaGF2ZSB0ZXN0ZWQg
aXQgYmVmb3JlIGFuZCBldmVyeXRoaW5nIGlzIGZpbmXvvIENCj4NCj4gPiArDQo+ID4gKy4uIHRv
Y3RyZWU6Og0KPiA+ICsgICA6bWF4ZGVwdGg6IDENCj4gPiArDQo+ID4gKyAgIGlycS9pbmRleA0K
PiA+ICsNCj4gPiArVG9kb2xpc3Q6DQo+ID4gKw0KPiA+ICsgICByZWZjb3VudC12cy1hdG9taWMN
Cj4gPiArICAgbG9jYWxfb3BzDQo+ID4gKyAgIHBhZGF0YQ0KPiA+ICsgICAuLi9SQ1UvaW5kZXgN
Cj4gPiArDQo+ID4gK+S9jue6p+ehrOS7tueuoeeQhg0KPiA+ICs9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KPiA+ICsNCj4gPiAr57yT5a2Y566h55CG77yMQ1BV54Ot5o+S5ouU566h55CG
562J44CCDQo+ID4gKw0KPiA+ICtUb2RvbGlzdDoNCj4gPiArDQo+ID4gKyAgIGNhY2hldGxiDQo+
ID4gKyAgIGNwdV9ob3RwbHVnDQo+ID4gKyAgIG1lbW9yeS1ob3RwbHVnDQo+ID4gKyAgIGdlbmVy
aWNpcnENCj4gPiArICAgcHJvdGVjdGlvbi1rZXlzDQo+ID4gKw0KPiA+ICsNCj4gPiAr5YaF5a2Y
566h55CGDQo+ID4gKz09PT09PT09PT09PT09PT09DQo+ID4gKw0KPiA+ICvlpoLkvZXlnKjlhoXm
oLjkuK3liIbphY3lkozkvb/nlKjlhoXlrZjjgILor7fms6jmhI/vvIzlnKgNCj4gPiArOmRvYzpg
L3ZtL2luZGV4YCDkuK3mnInmm7TlpJrnmoTlhoXlrZjnrqHnkIbmlofmoaPjgIINCj4NCj4gc28g
YXMgYWJvdmUNCkkgaGF2ZSB0ZXN0ZWQgaXQgYmVmb3JlIGFuZCBldmVyeXRoaW5nIGlzIGZpbmXv
vIENCj4NCj4gPiArDQo+ID4gK1RvZG9saXN0Og0KPiA+ICsNCj4gPiArICAgbWVtb3J5LWFsbG9j
YXRpb24NCj4gPiArICAgdW5hbGlnbmVkLW1lbW9yeS1hY2Nlc3MNCj4gPiArICAgZG1hLWFwaQ0K
PiA+ICsgICBkbWEtYXBpLWhvd3RvDQo+ID4gKyAgIGRtYS1hdHRyaWJ1dGVzDQo+ID4gKyAgIGRt
YS1pc2EtbHBjDQo+ID4gKyAgIG1tLWFwaQ0KPiA+ICsgICBnZW5hbGxvYw0KPiA+ICsgICBwaW5f
dXNlcl9wYWdlcw0KPiA+ICsgICBib290LXRpbWUtbW0NCj4gPiArICAgZ2ZwX21hc2stZnJvbS1m
cy1pbw0KPiA+ICsNCj4gPiAr5YaF5qC46LCD6K+V55qE5o6l5Y+jDQo+ID4gKz09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gK1RvZG9saXN0Og0KPiA+ICsNCj4gPiAr
ICAgZGVidWctb2JqZWN0cw0KPiA+ICsgICB0cmFjZXBvaW50DQo+ID4gKyAgIGRlYnVnZ2luZy12
aWEtb2hjaTEzOTQNCj4gPiArDQo+ID4gK+WFtuWug+S4gOWIh+aWh+ahow0KPg0KPiBtYXliZSBy
ZW1vdmUg5LiA5YiHID8NCk9LIQ0KPg0KPiA+ICs9PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4g
K+S4jemAguWQiOaUvuWcqOWFtuWug+WcsOaWueaIluWwmuacquW9kuexu+eahOaWh+S7tu+8mw0K
PiA+ICsNCj4gPiArVG9kb2xpc3Q6DQo+ID4gKw0KPiA+ICsgICBsaWJycw0KPiA+ICsNCj4gPiAr
Li4gb25seTo6IHN1YnByb2plY3QgYW5kIGh0bWwNCj4gPiArDQo+ID4gKyAgIEluZGljZXMNCj4g
PiArICAgPT09PT09PQ0KPiA+ICsNCj4gPiArICAgKiA6cmVmOmBnZW5pbmRleGANCj4gPiAtLQ0K
PiA+IDIuMjcuMA0KPg0KVGhhbmtzDQoNCllhbnRlbmcNCg==
