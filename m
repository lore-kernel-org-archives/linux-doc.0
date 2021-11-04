Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D8EC433EF
	for <linux-doc@archiver.kernel.org>; Thu,  4 Nov 2021 11:39:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E991610FD
	for <linux-doc@archiver.kernel.org>; Thu,  4 Nov 2021 11:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhKDLln (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Nov 2021 07:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhKDLln (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Nov 2021 07:41:43 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509FEC061714
        for <linux-doc@vger.kernel.org>; Thu,  4 Nov 2021 04:39:05 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id n128so6485368iod.9
        for <linux-doc@vger.kernel.org>; Thu, 04 Nov 2021 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AlxwR9jkBdToiCLnAcaR2+TUcSIY5VDVb0XZN37MxtY=;
        b=e2UAeaiWp5QYkKFSOSiyU5sSyGdlrcKjOGrMDbJFqnAUdWa08AEKUevbm5pH0zwB2j
         4Zeyj8609Pgv0z0W05b0hJH3Qrw9SOcIxz78/Pb+TEx72vwntW8Lb/zjP4KoCGmv4dz0
         ir8B+U6n4RnlMPvb17YM869sSX8201r03oIBlIn9BtTitBnqrBWLiN7ElcVxt/fgOoSm
         rN9wgPPoDTVtr47kWMLi5djtMWNKsUbRb7YMpjK64HpWMO2tHQCdOyf8Ua/kNSKOajJT
         cGf+JjPJeCP5ud7FlajyTn3c3ntxARGs0Cjh93CTrYiPS34UQi+tNwaUoODMOiP6K06+
         25Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AlxwR9jkBdToiCLnAcaR2+TUcSIY5VDVb0XZN37MxtY=;
        b=bz1JDq3AoRbRPajtoIMnRz5HAm0GRTHIPlopj4f1t0nhErAKym5JrDZ+BBvtzQer1v
         +yf1EWtG5lTMueB9Hivazft/SLDjPzPimnJVJnDMpvGXsfpcDHnVUi3Zt7VJgurXHl4S
         BpGaFi0ggxrpM910HH7AdHVrhaOAuWiXPQGbsuohdNodmi1PtL7FXo9JuvdIud9Eze9r
         5yZrjgR/TI5BIqEcl6aGoe/zTQokJlwIhr6OfrDvQCcJea4m8F09WXdliOyKIUjTis3i
         aL2HuSMY1OGvsJb5CcWB9OKWsEV7Jf3MMXGvGEi6RojcQfM47Fw9VTD0X2qweMFUI5wd
         sF9Q==
X-Gm-Message-State: AOAM531M1pWEiCaczuubyMSTmCeuBe6pRCZqyAKBv2lC1Xir/RWSwzzn
        iNfMucZjY2OTVX8OafYSALF7HTZD1WhgnfDbE18=
X-Google-Smtp-Source: ABdhPJyZzxhhhVJYvU61O6fV3J9w8uoxSbVtBf99l07oBXNikC+Rdo1jrV6UY2vlOUwa/OstSgcA+URTldTscHpciSM=
X-Received: by 2002:a05:6602:29c7:: with SMTP id z7mr36478262ioq.93.1636025944703;
 Thu, 04 Nov 2021 04:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635907089.git.siyanteng@loongson.cn> <90fa72d4031dbc024c1582fc3e0d35febd7923a4.1635907089.git.siyanteng@loongson.cn>
In-Reply-To: <90fa72d4031dbc024c1582fc3e0d35febd7923a4.1635907089.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 4 Nov 2021 19:38:28 +0800
Message-ID: <CAJy-Am=00msKXwBzG7fenoW+r4271AD_2sucTY74zM3EqaCnvA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs/zh_CN: update sparse translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, leoyang.li@nxp.com,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Puyu Wang <realpuyuwang@gmail.com>,
        Hu Haowen <src.res@email.cn>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gV2VkLCBOb3YgMywgMjAyMSBhdCAxMDo0NyBBTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBTcGFyc2UgZG9jdW1lbnRzIGFyZSB0b28gb3V0ZGF0ZWQs
bGV0J3MgdXBkYXRlIHNwYXJzZS5yc3QgdG8gdGhlIGxhdGVzdCB2ZXJzaW9uLg0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQoNCmxvb2tzIGZp
bmUgZm9yIG1lLg0KDQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQoN
Cj4gLS0tDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL2Rldi10b29scy9zcGFyc2UucnN0ICAg
fCA2MyArKysrKysrKysrKystLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9u
cygrKSwgMjMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9kZXYtdG9vbHMvc3BhcnNlLnJzdCBiL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL2Rldi10b29scy9zcGFyc2UucnN0DQo+IGluZGV4IDBmNDQ0YjgzZDYz
OS4uZTJkZjk5OWYyOTY3IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9kZXYtdG9vbHMvc3BhcnNlLnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9kZXYtdG9vbHMvc3BhcnNlLnJzdA0KPiBAQCAtMSwyOSArMSwyOSBAQA0K
PiAt77u/Q2hpbmVzZSB0cmFuc2xhdGVkIHZlcnNpb24gb2YgRG9jdW1lbnRhdGlvbi9kZXYtdG9v
bHMvc3BhcnNlLnJzdA0KPiAr77u/Q29weXJpZ2h0IDIwMDQgTGludXMgVG9ydmFsZHMNCj4gK0Nv
cHlyaWdodCAyMDA0IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6Pg0KPiArQ29weXJpZ2h0IDIw
MDYgQm9iIENvcGVsYW5kIDxtZUBib2Jjb3BlbGFuZC5jb20+DQo+DQo+IC1JZiB5b3UgaGF2ZSBh
bnkgY29tbWVudCBvciB1cGRhdGUgdG8gdGhlIGNvbnRlbnQsIHBsZWFzZSBjb250YWN0IHRoZQ0K
PiAtb3JpZ2luYWwgZG9jdW1lbnQgbWFpbnRhaW5lciBkaXJlY3RseS4gIEhvd2V2ZXIsIGlmIHlv
dSBoYXZlIGEgcHJvYmxlbQ0KPiAtY29tbXVuaWNhdGluZyBpbiBFbmdsaXNoIHlvdSBjYW4gYWxz
byBhc2sgdGhlIENoaW5lc2UgbWFpbnRhaW5lciBmb3INCj4gLWhlbHAuICBDb250YWN0IHRoZSBD
aGluZXNlIG1haW50YWluZXIgaWYgdGhpcyB0cmFuc2xhdGlvbiBpcyBvdXRkYXRlZA0KPiAtb3Ig
aWYgdGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggdGhlIHRyYW5zbGF0aW9uLg0KPiArLi4gaW5jbHVk
ZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+DQo+IC1DaGluZXNlIG1haW50YWluZXI6IExp
IFlhbmcgPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAtRG9jdW1lbnRh
dGlvbi9kZXYtdG9vbHMvc3BhcnNlLnJzdCDnmoTkuK3mlofnv7vor5ENCj4gKzpPcmlnaW5hbDog
RG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMvc3BhcnNlLnJzdA0KPg0KPiAt5aaC5p6c5oOz6K+E6K66
5oiW5pu05paw5pys5paH55qE5YaF5a6577yM6K+355u05o6l6IGU57O75Y6f5paH5qGj55qE57u0
5oqk6ICF44CC5aaC5p6c5L2g5L2/55So6Iux5paHDQo+IC3kuqTmtYHmnInlm7Dpmr7nmoTor53v
vIzkuZ/lj6/ku6XlkJHkuK3mlofniYjnu7TmiqTogIXmsYLliqnjgILlpoLmnpzmnKznv7vor5Hm
m7TmlrDkuI3lj4rml7bmiJbogIXnv7sNCj4gLeivkeWtmOWcqOmXrumimO+8jOivt+iBlOezu+S4
reaWh+eJiOe7tOaKpOiAheOAgg0KPiArOue/u+ivkToNCj4NCj4gLeS4reaWh+eJiOe7tOaKpOiA
he+8miDmnY7pmLMgIExpIFlhbmcgPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4gLeS4reaWh+eJiOe/
u+ivkeiAhe+8miDmnY7pmLMgIExpIFlhbmcgPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4gKyBMaSBZ
YW5nIDxsZW95YW5nLmxpQG54cC5jb20+DQo+DQo+ICs65qCh6K+ROg0KPg0KPiAt5Lul5LiL5Li6
5q2j5paHDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50
ZW5nQGxvb25nc29uLmNuPg0KPg0KPiAtQ29weXJpZ2h0IDIwMDQgTGludXMgVG9ydmFsZHMNCj4g
LUNvcHlyaWdodCAyMDA0IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6Pg0KPiAtQ29weXJpZ2h0
IDIwMDYgQm9iIENvcGVsYW5kIDxtZUBib2Jjb3BlbGFuZC5jb20+DQo+ICsuLiBfY25fc3BhcnNl
Og0KPiArDQo+ICtTcGFyc2UNCj4gKz09PT09PQ0KPiArDQo+ICtTcGFyc2XmmK/kuIDkuKpD56iL
5bqP55qE6K+t5LmJ5qOA5p+l5Zmo77yb5a6D5Y+v5Lul55So5p2l5Y+R546w5YaF5qC45Luj56CB
55qE5LiA5Lqb5r2c5Zyo6Zeu6aKY44CCIOWFsw0KPiAr5LqOc3BhcnNl55qE5qaC6L+w77yM6K+3
5Y+C6KeBaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzY4OTkwNy/vvJvmnKzmlofmoaPljIXlkKsN
Cj4gK+S4gOS6m+mSiOWvueWGheaguOeahHNwYXJzZeS/oeaBr+OAgg0KPiAr5YWz5LqOc3BhcnNl
55qE5pu05aSa5L+h5oGv77yM5Li76KaB5piv5YWz5LqO5a6D55qE5YaF6YOo57uT5p6E77yM5Y+v
5Lul5Zyo5a6D55qE5a6Y5pa5572R6aG15LiK5om+5Yiw77yaDQo+ICtodHRwczovL3NwYXJzZS5k
b2NzLmtlcm5lbC5vcmfjgIINCj4NCj4gIOS9v+eUqCBzcGFyc2Ug5bel5YW35YGa57G75Z6L5qOA
5p+lDQo+ICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiBAQCAtNjAsMjUgKzYwLDQyIEBA
IF9fYml0d2lzZSLnsbvlnovjgIINCj4gIOS4gOS4quWwj+aPkOmGku+8muW4uOaVsOaVtOaVsCIw
IuaYr+eJueauiueahOOAguS9oOWPr+S7peebtOaOpeaKiuW4uOaVsOmbtuW9k+S9nOS9jeaWueW8
j+aVtOaVsOS9v+eUqOiAjA0KPiAg5LiN55So5ouF5b+DIHNwYXJzZSDkvJrmirHmgKjjgILov5nm
mK/lm6DkuLoiYml0d2lzZSLvvIjmgbDlpoLlhbblkI3vvInmmK/nlKjmnaXnoa7kv53kuI3lkIzk
vY3mlrkNCj4gIOW8j+exu+Wei+S4jeS8muiiq+W8hOa3t++8iOWwj+WwvuaooeW8j++8jOWkp+Ww
vuaooeW8j++8jGNwdeWwvuaooeW8j++8jOaIluiAheWFtuS7lu+8ie+8jOWvueS7luS7rOadpeiv
tA0KPiAt5bi45pWwIjAi56Gu5a6e5piv54m55q6K55qE44CCDQo+ICvluLjmlbAiMCLnoa7lrp4g
KuaYryog54m55q6K55qE44CCDQo+ICsNCj4gK+S9v+eUqHNwYXJzZei/m+ihjOmUgeajgOafpQ0K
PiArLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiAr5LiL6Z2i55qE5a6P5a+55LqOIGdjYyDm
naXor7TmmK/mnKrlrprkuYnnmoTvvIzlnKggc3BhcnNlIOi/kOihjOaXtuWumuS5ie+8jOS7peS9
v+eUqHNwYXJzZeeahOKAnOS4iuS4i+aWh+KAnQ0KPiAr6Lef6Liq5Yqf6IO977yM5bqU55So5LqO
6ZSB5a6a44CCIOi/meS6m+azqOmHiuWRiuiviSBzcGFyc2Ug5LuA5LmI5pe25YCZ5pyJ6ZSB77yM
5Lul5Y+K5rOo6YeK55qE5Ye95pWw55qE6L+b5YWl5ZKMDQo+ICvpgIDlh7rjgIINCj4gKw0KPiAr
X19tdXN0X2hvbGQgLSDmjIflrprnmoTplIHlnKjlh73mlbDov5vlhaXlkozpgIDlh7rml7booqvm
jIHmnInjgIINCj4gKw0KPiArX19hY3F1aXJlcyAgLSDmjIflrprnmoTplIHlnKjlh73mlbDpgIDl
h7rml7booqvmjIHmnInvvIzkvYblnKjov5vlhaXml7bkuI3ooqvmjIHmnInjgIINCj4gKw0KPiAr
X19yZWxlYXNlcyAgLSDmjIflrprnmoTplIHlnKjlh73mlbDov5vlhaXml7booqvmjIHmnInvvIzk
vYblnKjpgIDlh7rml7bkuI3ooqvmjIHmnInjgIINCj4gKw0KPiAr5aaC5p6c5Ye95pWw5Zyo5LiN
5oyB5pyJ6ZSB55qE5oOF5Ya15LiL6L+b5YWl5ZKM6YCA5Ye677yM5Zyo5Ye95pWw5YaF6YOo5Lul
5bmz6KGh55qE5pa55byP6I635Y+W5ZKM6YeK5pS+6ZSB77yM5YiZ5LiNDQo+ICvpnIDopoHms6jp
h4rjgIINCj4gK+S4iumdoueahOS4ieS4quazqOmHiuaYr+mSiOWvuXNwYXJzZeWQpuWImeS8muaK
peWRiuS4iuS4i+aWh+S4jeW5s+ihoeeahOaDheWGteOAgg0KPg0KPiAg6I635Y+WIHNwYXJzZSDl
t6XlhbcNCj4gIH5+fn5+fn5+fn5+fn5+fn4NCj4NCj4gIOS9oOWPr+S7peS7jiBTcGFyc2Ug55qE
5Li76aG16I635Y+W5pyA5paw55qE5Y+R5biD54mI5pys77yaDQo+DQo+IC0gICAgICAgaHR0cDov
L3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvcGVvcGxlL2pvc2gvc3BhcnNlLw0KPiAr
ICAgICAgIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL3NvZnR3YXJlL2RldmVsL3NwYXJzZS9k
aXN0Lw0KPg0KPiAg5oiW6ICF77yM5L2g5Lmf5Y+v5Lul5L2/55SoIGdpdCDlhYvpmobmnIDmlrDn
moQgc3BhcnNlIOW8gOWPkeeJiOacrO+8mg0KPg0KPiAtICAgICAgIGdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qb3NoL3NwYXJzZS5naXQNCj4gKyAgICAgICBn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2RldmVsL3NwYXJzZS9zcGFyc2UuZ2l0DQo+DQo+
ICDkuIDml6bkvaDkuIvovb3kuobmupDnoIHvvIzlj6ropoHku6Xmma7pgJrnlKjmiLfouqvku73o
v5DooYzvvJoNCj4NCj4gICAgICAgICBtYWtlDQo+ICAgICAgICAgbWFrZSBpbnN0YWxsDQo+DQo+
IC3lroPlsIbkvJrooqvoh6rliqjlronoo4XliLDkvaDnmoQgfi9iaW4g55uu5b2V5LiL44CCDQo+
ICvlpoLmnpzmmK/moIflh4bnmoTnlKjmiLfvvIzlroPlsIbkvJrooqvoh6rliqjlronoo4XliLDk
vaDnmoR+L2JpbuebruW9leS4i+OAgg0KPg0KPiAg5L2/55SoIHNwYXJzZSDlt6XlhbcNCj4gIH5+
fn5+fn5+fn5+fn5+fn4NCj4gLS0NCj4gMi4yNy4wDQo+DQo=
