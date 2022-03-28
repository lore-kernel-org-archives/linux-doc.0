Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70944C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 08:33:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239379AbiC1IfR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 04:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239386AbiC1IfP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 04:35:15 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF8C1AF09
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 01:33:35 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2e6ceb45174so100490007b3.8
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 01:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XKleccTFA6unexX12psx27PnIDXGYQqUcxNvYVbCTM0=;
        b=WZq4V8ZBVV79GexImSKeCDx33gAcfMTrZ/H6lblcOXPbRLmRdYHudqBAcyp1bQCbEa
         Q/m0EalUUIHrTzJ2boBPzDOgWQ7l6+KGzgvkdLjBGxpia0aMVHWACSCec//Qobneac08
         cMl9w/zdnzzf3kF/HeGHhYLhgqXpIWRk2Vf8Pk3gHPCRVNp/VVZeGYTbzOHztHaZNNd7
         9cbuli/U3Zl1WFnYSZA0Rcq+xbVM1dvSq8KkXXObxCzqwd3lZHx/QX08nhW4XDD39glS
         fwJCdWRhzP9IL3/fasGK8E3yVvLjQ0SyvtI6XsYHmUnko8RhX01UHXWfbn0LPNtY82R/
         RPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XKleccTFA6unexX12psx27PnIDXGYQqUcxNvYVbCTM0=;
        b=WIekCAtl53mmW+10IW5qqzDfTQCDxM3XdC9/FXcoVOwc0EO+4L3OZzaAbeV8lcW5W7
         Ly6kx5I5mlqbb+nfM5AvakMJlNLMwQ9FQC8XrAuXFAO7V0TFHI7YTgPxIIf9/z97+3p4
         ewnnKj4nf8vQKCq861R6sF/RRf9r+Wzldxz3b6SEJakHFX/eWzutgxg7x8caBmwmQmR7
         9EALIlDx4QLbagozwacN/nqwoMOm2dTa9r6AnmYJcqahb5jAtmncIkq/iMg/0dC+M94G
         EgSucGeyvehGmrvTMpUyMw8yzoJlL/3iBPHOnvc+9xi7ak6ggPZN14bC8GyK65QUsp70
         ejYg==
X-Gm-Message-State: AOAM533LXzFQ0A2zZdO8Z2NkzHRHsgg0PIaMXyRDPob9P4s1d86xnTiT
        S/f4yQJgyH0C4y+qAFYloRgfSryuiAUq1NBLvDI=
X-Google-Smtp-Source: ABdhPJzAyl0GsSLoNGcV2zP+IaeC/h19WroP+dO4O2d25NHXfOR3xa7Ff3MAqZVaU6IrBUP99uNSVvX0VqkgP5oDWXk=
X-Received: by 2002:a81:1b8b:0:b0:2e5:c717:9da1 with SMTP id
 b133-20020a811b8b000000b002e5c7179da1mr23876573ywb.124.1648456414418; Mon, 28
 Mar 2022 01:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647498763.git.siyanteng@loongson.cn> <47e74b76b6b375d01c1e387f386faa2ef337fc20.1647498763.git.siyanteng@loongson.cn>
 <CAJy-AmnqnPjFOXvrVpjG4xbOSRZy7=C5xnNavxRw4HgFmS4aRw@mail.gmail.com>
In-Reply-To: <CAJy-AmnqnPjFOXvrVpjG4xbOSRZy7=C5xnNavxRw4HgFmS4aRw@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 28 Mar 2022 16:33:11 +0800
Message-ID: <CAEensMxiVRO=SFRV-MtpKKEe5xLQtrjSzQyWQGAi8xA0OGM4eg@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] docs/zh_CN: add vm z3fold translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIy5bm0M+aciDIy5pel5ZGo5LqMIDE1
OjM55YaZ6YGT77yaDQo+DQo+IE9uIFRodSwgTWFyIDE3LCAyMDIyIGF0IDI6NTEgUE0gWWFudGVu
ZyBTaSA8c2l5YW50ZW5nMDFAZ21haWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFlhbnRl
bmcgU2kgPHNpeWFudGVuZzAxQGdtYWlsLmNvbT4NCj4gPg0KPiA+IFRyYW5zbGF0ZSAuLi4vdm0v
ejNmb2xkLnJzdCBpbnRvIENoaW5lc2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5n
IFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdCB8ICAyICstDQo+ID4gIC4uLi90cmFuc2xh
dGlvbnMvemhfQ04vdm0vejNmb2xkLnJzdCAgICAgICAgICB8IDMxICsrKysrKysrKysrKysrKysr
KysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti92bS96M2ZvbGQucnN0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vdm0vaW5kZXgucnN0DQo+ID4gaW5kZXggOGM3ZDBiMWU1YzNlLi5lMjhkMGU5MTliZmUg
MTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5k
ZXgucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5k
ZXgucnN0DQo+ID4gQEAgLTM3LDYgKzM3LDcgQEAgVE9ETzrlvoXlvJXnlKjmlofmoaPpm4booqvn
v7vor5Hlrozmr5XlkI7or7flj4rml7bkv67mlLnmraTlpITvvIkNCj4gPiAgICAgcGFnZV90YWJs
ZV9jaGVjaw0KPiA+ICAgICByZW1hcF9maWxlX3BhZ2VzDQo+ID4gICAgIHNwbGl0X3BhZ2VfdGFi
bGVfbG9jaw0KPiA+ICsgICB6M2ZvbGQNCj4gPg0KPiA+ICBUT0RPTElTVDoNCj4gPiAgKiBhcmNo
X3BndGFibGVfaGVscGVycw0KPiA+IEBAIC00OSw1ICs1MCw0IEBAIFRPRE9MSVNUOg0KPiA+ICAq
IHRyYW5zaHVnZQ0KPiA+ICAqIHVuZXZpY3RhYmxlLWxydQ0KPiA+ICAqIHZtYWxsb2NlZC1rZXJu
ZWwtc3RhY2tzDQo+ID4gLSogejNmb2xkDQo+ID4gICogenNtYWxsb2MNCj4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vejNmb2xkLnJzdCBiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL3ozZm9sZC5yc3QNCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZmQwZjFhYzg1MGQ3DQo+ID4gLS0t
IC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Zt
L3ozZm9sZC5yc3QNCj4gPiBAQCAtMCwwICsxLDMxIEBADQo+ID4gKzpPcmlnaW5hbDogRG9jdW1l
bnRhdGlvbi92bS96M2ZvbGQucnN0DQo+ID4gKw0KPiA+ICs657+76K+ROg0KPiA+ICsNCj4gPiAr
IOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gKw0KPiA+
ICs65qCh6K+ROg0KPiA+ICsNCj4gPiArDQo+ID4gKz09PT09PQ0KPiA+ICt6M2ZvbGQNCj4gPiAr
PT09PT09DQo+ID4gKw0KPiA+ICt6M2ZvbGTmmK/kuIDkuKrkuJPpl6jnlKjkuo7lrZjlgqjljovn
vKnpobXnmoTliIbphY3lmajjgILlroPooqvorr7orqHkuLrmr4/kuKrniannkIbpobXmnIDlpJrl
j6/ku6XlrZjlgqjkuInkuKrljovnvKnpobXjgIINCj4gPiAr5a6D5pivemJ1ZOeahOihjeeUn+eJ
qe+8jOWFgeiuuOabtOmrmOeahOWOi+e8qeeOh++8jOS/neaMgeWFtuWJjei+iOeahOeugOWNleaA
p+WSjOehruWumuaAp+OAgg0KPiA+ICsNCj4gPiArejNmb2xk5ZKMemJ1ZOeahOS4u+imgeWMuuWI
q+aYrzoNCj4gPiArDQo+ID4gKyog5LiOemJ1ZOS4jeWQjOeahOaYr++8jHozZm9sZOWFgeiuuOac
gOWkp+eahFBBR0VfU0laReWIhumFjeOAgg0KPiA+ICsqIHozZm9sZOWcqOWFtumhtemdouS4reac
gOWkmuWPr+S7peWuuee6szPkuKrljovnvKnpobXpnaINCj4gPiArKiB6M2ZvbGTmnKzouqvmsqHm
nInovpPlh7rku7vkvZVBUEnvvIzlm6DmraTmiZPnrpfpgJrov4d6cG9vbOeahEFQSeadpeS9v+eU
qA0KPiA+ICsNCj4gPiAr5Li65LqG5L+d5oyB56Gu5a6a5oCn5ZKM566A5Y2V5oCn77yMejNmb2xk
77yM5bCx5YOPemJ1ZOS4gOagt++8jOaAu+aYr+WcqOavj+mhteWtmOWCqOS4gOS4quaVtOaVsOea
hOWOi+e8qemhte+8jOS9huaYrw0KPiA+ICvlroPmnIDlpJrlj6/ku6XlrZjlgqgz6aG177yM5LiN
5YOPemJ1ZOacgOWkmuWPr+S7peWtmOWCqDLpobXjgILlm6DmraTljovnvKnnjofovr7liLAyLjfl
gI3lt6blj7PvvIzogIx6YnVk55qE5Y6L57ypDQo+ID4gK+eOh+aYrzEuN+WAjeW3puWPs+OAgg0K
PiA+ICsNCj4gPiAr5LiN5YOPemJ1ZO+8iOS9huS5n+WDj3pzbWFsbG9j77yJ77yMejNmb2xkX2Fs
bG9jKCnpgqPmoLfkuI3ov5Tlm57kuIDkuKrlj6/ph43lpI3lvJXnlKjnmoTmjIfpkojjgILnm7jl
j43vvIzlroMNCj4gPiAr6L+U5Zue5LiA5Liq5peg56ym5Y+36ZW/5Y+l5p+E77yM5a6D57yW56CB
5LqG6KKr5YiG6YWN5a+56LGh55qE5a6e6ZmF5L2N572u44CCDQo+ID4gKw0KPiA+ICvkv53mjIHm
nInmlYjnmoTljovnvKnnjofmjqXov5Hkuo56c21hbGxvY++8jHozZm9sZOS4jeS+nei1luS6jk1N
VeeahOWQr+eUqO+8jOW5tuaPkOS+m+abtOWPr+mihOa1i+eahOWbnuaUtuihjA0KPiA+ICvkuLrv
vIzov5nkvb/lvpflroPmm7TpgILlkIjkuo7lsI/lnovlkozlk43lupTlhbPplK7nmoTns7vnu5/j
gIINCj4NCj4gcmVzcG9uc2UtY3JpdGljYWzvvIxndWVzcyBpdCBtZWFucyBxdWljayByZXNwb25z
ZSByZXF1aXJlZCBzeXN0ZW0uIHNvIOWPjeW6lOi/hemAn+eahD8NCmdyZWF0IQ0KDQpUaGFua3Ms
DQpZYW50ZW5nDQo+DQo+IFJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4N
Cj4NCj4gPiAtLQ0KPiA+IDIuMjcuMA0KPiA+DQo=
