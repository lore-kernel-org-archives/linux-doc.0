Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA11C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 15 Dec 2021 03:49:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235429AbhLODtm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Dec 2021 22:49:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235424AbhLODtl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Dec 2021 22:49:41 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E267C061574
        for <linux-doc@vger.kernel.org>; Tue, 14 Dec 2021 19:49:41 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id e128so27922645iof.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Dec 2021 19:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/ZQvMx9BT7uvk/OapLiyxS8m2tbAdqgonGI/UVRdon0=;
        b=ofmY72aD4/Kqfc+WkT9xDTznTLROQ/Fll4GAb7w9S79Xzzzf74Qw801F1kHMVISn+D
         zVkCw8oRZiP1rgX82mgtrJ1+13QfI4xMosz9EU3eIKWcyL6XsysZosnJzSp8M0XkluOR
         h1fxyBasXpGD7l0n1nXSQboF+BwDGA0fAQ0Mi0xzfBtauQnerpUy6mvd4UlcJHV8vRJF
         6xALD2NyeD49HNjHWBkwl2LZe4MyskWDZ6QOvJuTyEZw7w2YSs2E0kgGeR2xMax0VDHj
         IiWfinZztw3kjOknSqZ4CwYt11FEKfrc/JsSxnNWIQMjXRXF0pkE3s728y6sM2myR/4y
         M6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/ZQvMx9BT7uvk/OapLiyxS8m2tbAdqgonGI/UVRdon0=;
        b=adu16W8ZciF4P8+swo0sVvhDteX0ZrFF6m0wFXQe73uVlxMQO+GkNuvPUNrESiECW4
         e6haAb267zPh1K+wDUyqr/4soMks2Q4Bl2arVA5Ja8odLCdsKUFJ7cvwCTP9UqnIXTo2
         XyIikEqJZLj3e2JDTlDcAHEQJhRO4BEFvFoEv3baUEn7tNBiAMAol5GH8pCxMNPdps3z
         fCknMQ1LpqK1U/DrT53InUs1hzSKcDAmr5J+hghCv3pCkGpvZbmD5v9426BkayfV6fKx
         iAD5Utjywmwve2138snFWkDXAPCB753GsSGFTeBEoCIf7BHmhIjJJFAsFKWhG23CSPLU
         gIKA==
X-Gm-Message-State: AOAM532/m+q0pQkfqOM+6PECUnLFS8z7FuO51gutdpMWY4MVuV+bZXxT
        wz+7c2Dg2i1KtyVdJzPXBr8s6EPGY6x4QYqqjvPRv0ByHMKxgquQ
X-Google-Smtp-Source: ABdhPJynWvKVSmbZM4Csbiju/mIPxURim9dKBvM1pCl21t8oJooFXHaZkJXHHvX6TfOIaZj77IrmkSWtlDw6vA/GtXs=
X-Received: by 2002:a05:6638:2aa:: with SMTP id d10mr4793662jaq.493.1639540180912;
 Tue, 14 Dec 2021 19:49:40 -0800 (PST)
MIME-Version: 1.0
References: <20211215022955.21210-1-tangyizhou@huawei.com> <ae8d297b-896c-a6b3-b5f4-6cb48223e814@huawei.com>
In-Reply-To: <ae8d297b-896c-a6b3-b5f4-6cb48223e814@huawei.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 15 Dec 2021 11:49:03 +0800
Message-ID: <CAJy-Am=imZUw3rqeA6aBkvr=F1Yjt4TKd0Zcb_H8VnYCSRsrBA@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Add cputopology Chinese translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        yanteng si <siyanteng01@gmail.com>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gV2VkLCBEZWMgMTUsIDIwMjEgYXQgMTA6MTIgQU0gVGFuZyBZaXpob3UgPHRhbmd5aXpob3VA
aHVhd2VpLmNvbT4gd3JvdGU6DQo+DQo+IE9uIDIwMjEvMTIvMTUgMTA6MjksIFRhbmcgWWl6aG91
IHdyb3RlOg0KPiA+IFRyYW5zbGF0ZSBhZG1pbi1ndWlkZS9jcHV0b3BvbG9neS5yc3QgaW50byBD
aGluZXNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGFuZyBZaXpob3UgPHRhbmd5aXpob3VA
aHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3poX0NOL2FkbWluLWd1aWRlL2NwdXRvcG9s
b2d5LnJzdCAgICAgICAgIHwgOTQgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAuLi4vdHJhbnNs
YXRpb25zL3poX0NOL2FkbWluLWd1aWRlL2luZGV4LnJzdCAgfCAgMiArLQ0KPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDk1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL2Nw
dXRvcG9sb2d5LnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL2FkbWluLWd1aWRlL2NwdXRvcG9sb2d5LnJzdCBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL2NwdXRvcG9sb2d5LnJzdA0KPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5mOGQ1YzUwMjUzMzANCj4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vYWRtaW4tZ3VpZGUvY3B1dG9wb2xvZ3kucnN0DQo+ID4gQEAgLTAsMCArMSw5NCBAQA0KPiA+
ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsuLiBpbmNsdWRlOjog
Li4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gPiArDQo+ID4gKzpPcmlnaW5hbDogRG9jdW1lbnRh
dGlvbi9hZG1pbi1ndWlkZS9jcHV0b3BvbG9neS5yc3QNCj4gPiArDQo+ID4gKzrnv7vor5E6DQo+
ID4gKw0KPiA+ICsgIOWUkOiJuuiInyBUYW5nIFlpemhvdSA8dGFuZ3llZWNob3VAZ21haWwuY29t
Pg0KPiA+ICsNCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiAr5aaC5L2V6YCa
6L+Hc3lzZnPlsIZDUFXmi5PmiZHlr7zlh7oNCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09
PT0NCj4gPiArDQo+ID4gK0NQVeaLk+aJkeS/oeaBr+mAmui/h3N5c2Zz5a+85Ye644CC5pi+56S6
55qE6aG577yI5bGe5oCn77yJ5ZKM5p+Q5Lqb5p625p6E55qEL3Byb2MvY3B1aW5mb+i+k+WHuueb
uOS8vOOAguWug+S7rOS9jeS6jg0KPiA+ICsvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHVYL3Rv
cG9sb2d5L+OAguivt+mYheivu0FCSeaWh+S7tu+8mg0KPiA+ICtEb2N1bWVudGF0aW9uL0FCSS9z
dGFibGUvc3lzZnMtZGV2aWNlcy1zeXN0ZW0tY3B144CCDQo+ID4gKw0KPiA+ICtkcml2ZXJzL2Jh
c2UvdG9wb2xvZ3kuY+aYr+S9k+ezu+e7k+aehOS4reaAp+eahO+8jOWug+WvvOWHuuS6hui/meS6
m+WxnuaAp+OAgueEtuiAjO+8jGRpZeOAgWNsdXN0ZXLjgIFib29r44CBDQo+ID4gK2RyYXfov5nk
upvlsYLmrKHnu5PmnoTnm7jlhbPnmoTmlofku7bku4XlnKjkvZPns7vnu5PmnoTmj5Dkvpvkuobk
uIvmlofmj4/ov7DnmoTlro/nmoTmnaHku7bkuIvooqvliJvlu7rjgIINCj4gPiArDQo+ID4gK+Wv
ueS6juaUr+aMgei/meS4queJueaAp+eahOS9k+ezu+e7k+aehO+8jOWug+W/hemhu+WcqGluY2x1
ZGUvYXNtLVhYWC90b3BvbG9neS5o5Lit5a6a5LmJ6L+Z5Lqb5a6P5Lit55qE5LiA6YOo5YiGOjoN
Cj4gPiArDQo+ID4gKyAgICAgI2RlZmluZSB0b3BvbG9neV9waHlzaWNhbF9wYWNrYWdlX2lkKGNw
dSkNCj4gPiArICAgICAjZGVmaW5lIHRvcG9sb2d5X2RpZV9pZChjcHUpDQo+ID4gKyAgICAgI2Rl
ZmluZSB0b3BvbG9neV9jbHVzdGVyX2lkKGNwdSkNCj4gPiArICAgICAjZGVmaW5lIHRvcG9sb2d5
X2NvcmVfaWQoY3B1KQ0KPiA+ICsgICAgICNkZWZpbmUgdG9wb2xvZ3lfYm9va19pZChjcHUpDQo+
ID4gKyAgICAgI2RlZmluZSB0b3BvbG9neV9kcmF3ZXJfaWQoY3B1KQ0KPiA+ICsgICAgICNkZWZp
bmUgdG9wb2xvZ3lfc2libGluZ19jcHVtYXNrKGNwdSkNCj4gPiArICAgICAjZGVmaW5lIHRvcG9s
b2d5X2NvcmVfY3B1bWFzayhjcHUpDQo+ID4gKyAgICAgI2RlZmluZSB0b3BvbG9neV9jbHVzdGVy
X2NwdW1hc2soY3B1KQ0KPiA+ICsgICAgICNkZWZpbmUgdG9wb2xvZ3lfZGllX2NwdW1hc2soY3B1
KQ0KPiA+ICsgICAgICNkZWZpbmUgdG9wb2xvZ3lfYm9va19jcHVtYXNrKGNwdSkNCj4gPiArICAg
ICAjZGVmaW5lIHRvcG9sb2d5X2RyYXdlcl9jcHVtYXNrKGNwdSkNCj4gPiArDQo+ID4gK2BgKipf
aWQgbWFjcm9zYGAg55qE57G75Z6L5pivaW5044CCDQo+ID4gK2BgKipfY3B1bWFzayBtYWNyb3Ng
YCDnmoTnsbvlnovmmK8gYGAoY29uc3QpIHN0cnVjdCBjcHVtYXNrICpgYCDjgILlkI7ogIXlkozm
gbDlvZPnmoQNCj4gPiArYGAqKl9zaWJsaW5nc2BgIHN5c2Zz5bGe5oCn5a+55bqU77yI6Zmk5LqG
dG9wb2xvZ3lfc2libGluZ19jcHVtYXNrKCnvvIzlroPlkox0aHJlYWRfc2libGluZ3MNCj4gPiAr
5a+55bqU77yJ44CCDQo+ID4gKw0KPiA+ICvkuLrkuoblnKjmiYDmnInkvZPns7vnu5PmnoTkuIrk
v53mjIHkuIDoh7TvvIxpbmNsdWRlL2xpbnV4L3RvcG9sb2d5Lmjmj5DkvpvkuobkuIrov7DmiYDm
nInlro/nmoTpu5jorqTlrprkuYnvvIzku6XpmLINCj4gPiAr5a6D5Lus5pyq5ZyoaW5jbHVkZS9h
c20tWFhYL3RvcG9sb2d5LmjkuK3lrprkuYk6DQo+ID4gKw0KPiA+ICsxKSB0b3BvbG9neV9waHlz
aWNhbF9wYWNrYWdlX2lkOiAtMQ0KPiA+ICsyKSB0b3BvbG9neV9kaWVfaWQ6IC0xDQo+ID4gKzMp
IHRvcG9sb2d5X2NsdXN0ZXJfaWQ6IC0xDQo+ID4gKzQpIHRvcG9sb2d5X2NvcmVfaWQ6IDANCj4g
PiArNSkgdG9wb2xvZ3lfYm9va19pZDogLTENCj4gPiArNikgdG9wb2xvZ3lfZHJhd2VyX2lkOiAt
MQ0KPiA+ICs3KSB0b3BvbG9neV9zaWJsaW5nX2NwdW1hc2s6IOS7heWFpeWPgkNQVQ0KPiA+ICs4
KSB0b3BvbG9neV9jb3JlX2NwdW1hc2s6IOS7heWFpeWPgkNQVQ0KPiA+ICs5KSB0b3BvbG9neV9j
bHVzdGVyX2NwdW1hc2s6IOS7heWFpeWPgkNQVQ0KPiA+ICsxMCkgdG9wb2xvZ3lfZGllX2NwdW1h
c2s6IOS7heWFpeWPgkNQVQ0KPiA+ICsxMSkgdG9wb2xvZ3lfYm9va19jcHVtYXNrOiAg5LuF5YWl
5Y+CQ1BVDQo+ID4gKzEyKSB0b3BvbG9neV9kcmF3ZXJfY3B1bWFzazog5LuF5YWl5Y+CQ1BVDQo+
ID4gKw0KPiA+ICvmraTlpJbvvIxDUFXmi5PmiZHkv6Hmga/nlLEvc3lzL2RldmljZXMvc3lzdGVt
L2NwdeaPkOS+m++8jOWMheWQq+S4i+i/sOaWh+S7tuOAgui+k+WHuuWvueW6lOeahOWGhemDqOaV
sOaNrua6kOaUvuWcqA0KPiA+ICvmlrnmi6zlj7fvvIgiW10i77yJ5Lit44CCDQo+ID4gKw0KPiA+
ICsgICAgPT09PT09PT09PT0gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCj4gPiArICAgIGtlcm5lbF9tYXg6IOWGheaguOmFjee9ruWFgeiuuOeahOac
gOWkp0NQVeS4i+agh+WAvOOAgltOUl9DUFVTLTFdDQo+ID4gKw0KPiA+ICsgICAgb2ZmbGluZTog
ICAg55Sx5LqO54Ot5o+S5ouU56e76Zmk5oiW6ICF6LaF6L+H5YaF5qC45YWB6K6455qEQ1BV5LiK
6ZmQ77yI5LiK5paH5o+P6L+w55qEa2VybmVsX21heO+8ieWvvOiHtOacquS4iue6v+eahENQVeOA
glt+Y3B1X29ubGluZV9tYXNrICsgY3B1cyA+PSBOUl9DUFVTXQ0KPg0KPiBIZXJlIGlzIGFuIGV4
YW1wbGUgb2YgcG9vciBDaGluZXNlIHN1cHBvcnQuIElmIGEgbGluZSBicmVhayBpcyBtYWRlIGhl
cmUsDQo+ICptYWtlIGh0bWxkb2NzKiB3YXJucyAnTWFsZm9ybWVkIHRhYmxlJy4NCg0KVGhhbmtz
IGZvciB0aGUgaW5mby4NCg0KQ29tcGFyZSB0byB0aGUgd2FybmluZyBhbmQgYSBzcGFjZSBpbiB3
ZWJwYWdlLCBJJ2QgcHJlZmVyIHVzaW5nIGxpbmUgYnJlYWsgZm9yDQphIG5lYXQgc291cmNlIGRv
Yy4gR3Vlc3MgSm9uIHdvdWxkIGNvbnNpZGVyIGFuZCBwZXJtaXQgdGhpcy4NCg0KPg0KPiBNZWFu
d2hpbGUsIHRoZSBudW1iZXIgb2YgJz0nIGNhbiBiZSBpbmNvbnNpc3RlbnQgd2l0aCB0aGUgbnVt
YmVyIG9mIENoaW5lc2UNCj4gY2hhcnMgYW5kIHRoZXJlIHdvbid0IGJlIGFueSB3YXJuaW5ncy4g
SSd2ZSBhbHJlYWR5IGNoZWNrZWQgdGhlIEhUTUwgcGFnZSwNCj4gdGhlIHJlbmRlcmluZyBlZmZl
Y3QgaXMgT0suDQoNClVoLCB0aGF0J3MgYSBiaXQgaW5jb252ZW5pdGVudCBmb3IgdXMuIHdlJ2Qg
YmV0dGVyIHRvIGRvdWJsZSBjaGVjayB0aGUNCic9JyB0byBtYWtlDQpzdXJlIGl0IGZpdCB0aGUg
Y2hhcnMgbnVtYmVyIGNvcnJlY3RseS4NCg0KVGhhbmtzDQpBbGV4DQo=
