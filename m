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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B1EC433E6
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 03:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3EF8238A0
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 03:37:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726459AbhAUDec (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jan 2021 22:34:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbhAUBZM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jan 2021 20:25:12 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED66C061786
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 17:24:28 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id g1so560967edu.4
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 17:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ctNoLEME/XuZ40qnJDOydbewZGHRwVfAeFUiXsiLnfk=;
        b=VeoCATLPKu6UnICRXoWRcJ0cT9uTETXG2Z6DyjgolCJMsuQ076FlrfUmBsZcLo08jG
         EiZHaX/4RJ/Oq8LB5tXwVAzaei84vViodg5+oQpZ/jRs2D4EvL+AAhCRLM0B+BcZwa42
         3fGAioEdGTIwAPgmQ5aNy2FJq+r42za/zauJvS8VwrTU75TchXak+SqWEA7CvpceNKbQ
         8Gz2+nNEBymS7NQTBHzrAl3P4x6NKeY5AMeeal7SjxrwRuwMZQoW8JCLZztgxaF/CUxa
         FWUvpPnuWKIdnpfMtWiPYySE6y0ZNdqhoOCepjMyeNFui+nwiiVjYALzQw52rjeBpzON
         jWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ctNoLEME/XuZ40qnJDOydbewZGHRwVfAeFUiXsiLnfk=;
        b=HkytmQHrBDUncImtRjR/jRgXRG4xK8VUBL2Re1j8dUfRkLngMo3IsXPgba6caf7ItG
         C8dV07gjqnV0bZvY+Ln2rG46ECt8xPtpWYKgmqH5P5ojiBM9p1Br57ezPt7RsROlMEET
         l2/yJiZBymttsoR5oJIs6NdcYYD426y9pZNQhpSk2l/kljuWmcvkUTPO4gDfvoSLRhiI
         Y/oDAP2+CSELjvxQMEs51nKhQfkjzQ5IQb98Z3ySVqHRykRnV4RM9SOMlNvmDFrTb4S+
         BlUm+qPnP4SCz+8BXm/Hbnew/v4fewR/gs9XXhqQtGyuCJgzu65R5u1j6oKfWB3zRvpc
         URww==
X-Gm-Message-State: AOAM531j3v4naMRs4LFIgG2zt85HdMkK2Klm64IrOAOUEFjCiqD4jfn9
        oX1o3mjcafFOTQqJS89GC/1cKmrWQLQc99drsPw=
X-Google-Smtp-Source: ABdhPJwtlEXhlSLrJakdRXPOwl1ysAWhM8py6+SXAQ/bGy4ZJ24OlE2ki63ua2Sz9/xgUvR2d69vlUV+dkBsfO78sK4=
X-Received: by 2002:a05:6402:1682:: with SMTP id a2mr9554011edv.30.1611192267375;
 Wed, 20 Jan 2021 17:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20210120110155.405589-1-siyanteng@loongson.cn> <ee63bbf8-c69f-8f66-339a-9b5d34b4e96a@linux.alibaba.com>
In-Reply-To: <ee63bbf8-c69f-8f66-339a-9b5d34b4e96a@linux.alibaba.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 21 Jan 2021 09:24:16 +0800
Message-ID: <CAEensMw=6PDcdS4ORPMDM5O8rfS-9zuigpM+Ajifjx1cxBsR9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] docs/zh_CN: add iio iio_configfs.rst translation
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T0ssVGhhbmsgeW91IQ0KDQpBbGV4IFNoaSA8YWxleC5zaGlAbGludXguYWxpYmFiYS5jb20+IOS6
jjIwMjHlubQx5pyIMjDml6XlkajkuIkg5LiL5Y2INzoxMuWGmemBk++8mg0KPg0KPg0KPg0KPiDl
nKggMjAyMS8xLzIwIOS4i+WNiDc6MDEsIFlhbnRlbmcgU2kg5YaZ6YGTOg0KPiA+IFRoaXMgcGF0
Y2ggdHJhbnNsYXRlcyBEb2N1bWVudGF0aW9uL2lpby9paW9fY29uZmlnZnMucnN0IGludG8gQ2hp
bmVzZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4NCj4gPiAtLS0NCj4gPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9paW8vaWlvX2Nv
bmZpZ2ZzLnJzdCAgIHwgMTAyICsrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTAyIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL2lpby9paW9fY29uZmlnZnMucnN0DQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaWlvL2lpb19jb25maWdm
cy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9paW8vaWlvX2NvbmZpZ2Zz
LnJzdA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4y
MjNiYzczMmNlNjYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vaWlvL2lpb19jb25maWdmcy5yc3QNCj4gPiBAQCAtMCwwICsxLDEw
MiBAQA0KPiA+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gPiArDQo+
ID4gKzpPcmlnaW5hbDogOmRvYzpgLi4vLi4vLi4vaWlvL2lpb19jb25maWdmc2ANCj4gPiArOlRy
YW5zbGF0b3I6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiArDQo+ID4g
Ky4uIF9jbl9paW9faWlvX2NvbmZpZ2ZzOg0KPg0KPiBndWVzcyBvbmUgaWlvIGluIG5hbWUgaXMg
ZW5vdWdoPw0KPg0KPiA+ICsNCj4gPiArDQo+ID4gKz09PT09PT09PT09PT09PT09PT09PQ0KPiA+
ICvlt6XkuJogSUlPIGNvbmZpZ2Zz5pSv5oyBDQo+ID4gKz09PT09PT09PT09PT09PT09PT09PQ0K
PiA+ICsNCj4gPiArMS4g5qaC6L+wDQo+ID4gKz09PT09PT0NCj4gPiArDQo+ID4gK0NvbmZpZ2Zz
5piv5LiA56eN5YaF5qC45a+56LGh55qE5Z+65LqO5paH5Lu257O757uf55qE566h55CG57O757uf
77yMSUlP5L2/55So5LiA5Lqb5Y+v5Lul6YCa6L+HDQo+ID4gK2NvbmZpZ2Zz6L275p2+6YWN572u
55qE5a+56LGh77yI5L6L5aaC77ya6K6+5aSH77yM6Kem5Y+R5Zmo77yJ44CCDQo+ID4gKw0KPiA+
ICvlhbPkuo5jb25maWdmc+aYr+WmguS9lei/kOihjOeahO+8jOivt+afpemYhURvY3VtZW50YXRp
b24vZmlsZXN5c3RlbXMvY29uZmlnZnMucnN0DQo+ID4gK+S6huino+abtOWkmuS/oeaBr+OAgg0K
PiA+ICsNCj4gPiArMi4g55So5rOVDQo+ID4gKz09PT09PT0NCj4gPiAr5Li65LqG5L2/Y29uZmln
ZnPmlK/mjIFJSU/vvIzmiJHku6zpnIDopoHlnKjnvJbor5Hml7bpgInkuK1jb25maWfnmoRDT05G
SUdfSUlPX0NPTkZJR0ZTDQo+ID4gK+mAiemhueOAgg0KPiA+ICsNCj4gPiAr54S25ZCO77yM5oyC
6L29Y29uZmlnZnPmlofku7bns7vnu58o6YCa5bi45ZyoIC9jb25maWcgZGlyZWN0b3J555uu5b2V
5LiL77yJ77ya77yaDQo+ID4gKw0KPiA+ICsgICQgbWtkaXIvY29uZmlnDQo+ID4gKyAgJCBtb3Vu
dCAtdCBjb25maWdmcyBub25lL2NvbmZpZw0KPiA+ICsNCj4gPiAr5q2k5pe277yM5bCG5Yib5bu6
5omA5pyJ6buY6K6kSUlP57uE77yM5bm25Y+v5Lul5ZyoLyBjb25maWcgLyBpaW/kuIvlr7nlhbbo
v5vooYzorr/pl67jgIIg5LiL5LiA56ugDQo+ID4gK+WwhuS7i+e7jeWPr+eUqOeahElJT+mFjee9
ruWvueixoeOAgg0KPiA+ICsNCj4gPiArMy4g6L2v5Lu26Kem5Y+R5ZmoDQo+ID4gKz09PT09PT09
PT09PT0NCj4gPiArDQo+ID4gK0lJT+m7mOiupGNvbmZpZ2Zz57uE5LmL5LiA5piv4oCc6Kem5Y+R
5Zmo4oCd57uE44CCIOaMgui9vWNvbmZpZ2Zz5ZCO5Y+v5Lul6Ieq5Yqo6K6/6Zeu5a6D77yM5bm2
5LiU5Y+vDQo+ID4gK+S7peWcqC9jb25maWcvaWlvL3RyaWdnZXJz5LiL5om+5Yiw44CCDQo+ID4g
Kw0KPiA+ICtJSU/ova/ku7bop6blj5HlmajkuLrliJvlu7rlpJrnp43op6blj5Hlmajnsbvlnovm
j5DkvpvkuobmlK/mjIHjgIIg6YCa5bi45ZyoaW5jbHVkZS9saW51eC9paW8NCj4gPiArL3N3X3Ry
aWdnZXIuaO+8muS4reeahOaOpeWPo+S4i+WwhuaWsOeahOinpuWPkeWZqOexu+Wei+WunueOsOS4
uuWNleeLrOeahOWGheaguOaooeWdl++8mg0KPiA+ICsNCj4gPiArICAvKg0KPiA+ICsgICAqIGRy
aXZlcnMvaWlvL3RyaWdnZXIvaWlvLXRyaWctc2FtcGxlLmMNCj4gPiArICAgKiDkuIDnp43mlrDo
p6blj5HlmajnsbvlnovnmoTlhoXmoLjmqKHlnZflrp7kvosNCj4gPiArICAgKi8NCj4gPiArICAj
aW5jbHVkZSA8bGludXgvaWlvL3N3X3RyaWdnZXIuaD4NCj4gPiArDQo+ID4gKw0KPiA+ICsgIHN0
YXRpYyBzdHJ1Y3QgaWlvX3N3X3RyaWdnZXIgKmlpb190cmlnX3NhbXBsZV9wcm9iZShjb25zdCBj
aGFyICpuYW1lKQ0KPiA+ICsgIHsNCj4gPiArICAgICAvKg0KPiA+ICsgICAgICAqIOi/meWwhuWI
humFjeW5tuazqOWGjOS4gOS4qklJT+inpuWPkeWZqOS7peWPiuWFtuS7luinpuWPkeWZqOexu+We
i+eJueaAp+eahOWIneWni+WMluOAgg0KPiA+ICsgICAgICAqLw0KPiA+ICsgIH0NCj4gPiArDQo+
ID4gKyAgc3RhdGljIGludCBpaW9fdHJpZ19zYW1wbGVfcmVtb3ZlKHN0cnVjdCBpaW9fc3dfdHJp
Z2dlciAqc3d0KQ0KPiA+ICsgIHsNCj4gPiArICAgICAvKg0KPiA+ICsgICAgICAqIOi/meS8muW6
n+W8g2lpb190cmlnX3NhbXBsZV9wcm9iZeS4reeahOaTjeS9nA0KPiA+ICsgICAgICAqLw0KPiA+
ICsgIH0NCj4gPiArDQo+ID4gKyAgc3RhdGljIGNvbnN0IHN0cnVjdCBpaW9fc3dfdHJpZ2dlcl9v
cHMgaWlvX3RyaWdfc2FtcGxlX29wcyA9IHsNCj4gPiArICAgICAucHJvYmUgICAgICAgICAgPSBp
aW9fdHJpZ19zYW1wbGVfcHJvYmUsDQo+ID4gKyAgICAgLnJlbW92ZSAgICAgICAgID0gaWlvX3Ry
aWdfc2FtcGxlX3JlbW92ZSwNCj4gPiArICB9Ow0KPiA+ICsNCj4gPiArICBzdGF0aWMgc3RydWN0
IGlpb19zd190cmlnZ2VyX3R5cGUgaWlvX3RyaWdfc2FtcGxlID0gew0KPiA+ICsgICAgIC5uYW1l
ID0gInRyaWctc2FtcGxlIiwNCj4gPiArICAgICAub3duZXIgPSBUSElTX01PRFVMRSwNCj4gPiAr
ICAgICAub3BzID0gJmlpb190cmlnX3NhbXBsZV9vcHMsDQo+ID4gKyAgfTsNCj4gPiArDQo+ID4g
K21vZHVsZV9paW9fc3dfdHJpZ2dlcl9kcml2ZXIoaWlvX3RyaWdfc2FtcGxlKTsNCj4gPiArDQo+
ID4gK+avj+enjeinpuWPkeWZqOexu+Wei+WcqC9jb25maWcvaWlvL3RyaWdnZXJz5LiL6YO95pyJ
5YW26Ieq5bex55qE55uu5b2V44CCIOWKoOi9vWlpby10cmlnLXNhbXBsZQ0KPiA+ICvmqKHlnZfl
sIbliJvlu7rigJwgdHJpZy1zYW1wbGXigJ3op6blj5Hlmajnsbvlnovnm67lvZUvY29uZmlnL2lp
by90cmlnZ2Vycy90cmlnLXNhbXBsZS4NCj4gPiArDQo+ID4gK+aIkeS7rOaUr+aMgeS7peS4i+S4
reaWrea6kO+8iOinpuWPkeWZqOexu+Wei++8iQ0KPiA+ICsNCj4gPiArICAgICAqIGhydGltZXIs
IGhydGltZXLvvIzkvb/nlKjpq5jliIbovqjnjoflrprml7blmajkvZzkuLrkuK3mlq3mupANCj4g
PiArDQo+ID4gKzMuMSBIcnRpbWVyIEhydGltZXLop6blj5HlmajliJvlu7rkuI7plIDmr4ENCj4N
Cj4gRG8gd2UgbmVlZCAyIGhydGltZXIgaGVyZT8NCj4NCj4gVGhhbmtzDQo+DQo+ID4gKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICvliqDovb1paW8tdHJp
Zy1ocnRpbWVy5qih5Z2X5bCG5rOo5YaMaHJ0aW1lcuinpuWPkeWZqOexu+Wei++8jOS7juiAjOWF
geiuuOeUqOaIt+WcqA0KPiA+ICsvY29uZmlnL2lpby90cmlnZ2Vycy9ocnRpbWVy5LiL5Yib5bu6
aHJ0aW1lcuinpuWPkeWZqOOAgg0KPiA+ICsNCj4gPiAr5L6L5aaCOjoNCj4gPiArDQo+ID4gKyAg
JCBta2RpciAvY29uZmlnL2lpby90cmlnZ2Vycy9ocnRpbWVyL2luc3RhbmNlMQ0KPiA+ICsgICQg
cm1kaXIgL2NvbmZpZy9paW8vdHJpZ2dlcnMvaHJ0aW1lci9pbnN0YW5jZTENCj4gPiArDQo+ID4g
K+avj+S4quinpuWPkeWZqOWPr+S7peWFt+acieS4gOS4quaIluWkmuS4queLrOeJueeahOinpuWP
keWZqOexu+Wei+eahOWxnuaAp+OAgg0KPiA+ICsNCj4gPiArMy4yICJocnRpbWVyIiDop6blj5Hl
majnsbvlnovlsZ7mgKcNCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICsN
Cj4gPiArImhydGltZXLigJ3op6blj5HlmajnsbvlnovmsqHmnInmnaXoh6ovY29uZmlnIGRpcuea
hOS7u+S9leWPr+mFjee9ruWxnuaAp+OAgg0KPiA+ICvkvYblroPnoa7lrp7lsIbph4fmoLfpopHn
joflsZ7mgKflvJXlhaXkuobop6blj5Hnm67lvZXjgIINCj4gPg0K
