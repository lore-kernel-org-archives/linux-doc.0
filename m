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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AB4C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 14:24:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3E1261166
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 14:24:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233916AbhDPOYi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 10:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233606AbhDPOYh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 10:24:37 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2832C061574
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 07:24:12 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id lt13so5240044pjb.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=95p+Fyd7eo08CRhOtYcgaxfNfN6hK8UCA9BXv01FiYo=;
        b=u3F0iM6YTxIhgshZvH6veejM2mQyCdBQmoBWx86Xw0Y+hhUNG0aeLP5IrMnu1418dr
         9Jbg6/hTcU7LrpdrcRnRysHIIEl6WYnhpMmbgWn/MCk4gUw0RIa0AHa4hCIwZPEEeb3r
         70RSZjn+w+vgpeXJ3YXp4vO8seVwlcGWrLaW5X4c5+z6zhJ5CadDOFxvTNNXgSwBUClU
         KvmS3kZKuDWfjLeVeQaJ3hCJ4n5vCMgjBZLXyGkXDxTtkRl98Sb/q74QEYscvZ2G5q44
         grnvy4MzlDarpdBJ6H4QplHGCBoROYYsuc0eEE1QYajmPb2ko/abTdXzReR+CoValSqB
         lP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=95p+Fyd7eo08CRhOtYcgaxfNfN6hK8UCA9BXv01FiYo=;
        b=NVvbquKRxLo6VWp+KgrLTxopmqm0sntvoURWmqEoN+dPmCw79tAt+uawlG/3jpnjZB
         zEOwlE0vKB+YAJe9dUvQW9VbWO/5fEE2QHMgIQidL6H8shPe2oGmUtcnLGb4J+tb7GV9
         b5jK3wYg3MWK57U3RpSsuFHH2CR8aWSSOc0KOMxrJzrWkGd3YhJwD7nWG3ZShAaKq6iG
         9J9k6geB+q3rOfpRwb8vUj2cVyZP8PvrkKvEebL6OYP+rFUDwHPTKT1L7GyhBux2ovw8
         r+cXaEU5ENhxuC20t4Vfl2FjLLIqFV8aQ306hAFfx8PvG/TFw4yaKnEUqGpV86tcJ67m
         SaIA==
X-Gm-Message-State: AOAM530NfM2PvnVoGmiAQDc/2FCbpz7zZqYdgTWAs3gCezgYcGPsTSnA
        DWxJ6vjP/+D7E6h1z0Z49TAz5+ljyUDUHMFvdKg=
X-Google-Smtp-Source: ABdhPJwYkkVrjr900ZT7WQ8TTDbqugIQFMrbZDyIXl9dj2n2Dfpc/PXlJduyzEypcoUY35DfZJaHXJfmwmh3LFRORRI=
X-Received: by 2002:a17:90a:f40a:: with SMTP id ch10mr9792403pjb.62.1618583052328;
 Fri, 16 Apr 2021 07:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210416074652.GA6138@bobwxc.top>
In-Reply-To: <20210416074652.GA6138@bobwxc.top>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Fri, 16 Apr 2021 22:24:00 +0800
Message-ID: <CAMU9jJpH6Tat8f+R=+WF02mFGP2ggL95Vs_Lk3cOuEmLTmTeyw@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Adjust order and content of zh_CN/index.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huang JiangHui <huangjianghui@uniontech.com>,
        Bailu Lin <bailu.lin@vivo.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDE25pel5ZGo5LqU
IOS4i+WNiDQ6MDblhpnpgZPvvJoNCj4NCj4gQWRqdXN0IG9yZGVyIGFuZCBjb250ZW50IG9mIHpo
X0NOL2luZGV4LnJzdCB0byBtYWtlIGl0IGNsZWFyLA0KPiBDb21wbGV0ZSBpbnRyb2R1Y3Rpb25z
IGFuZCBUT0RPTGlzdHMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFd1IFhpYW5nQ2hlbmcgPGJvYnd4
Y0BlbWFpbC5jbj4NCj4gLS0tDQo+IGRvY3MtbmV4dCB0cmVlDQo+IGJhc2UtY29tbWl0OiBmOWJi
YzEyY2NiMzVhYzhiM2ZhMDFjZWMxYTE5Y2I1MjNhNzcwN2M3DQo+DQo+ICBEb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9pbmRleC5yc3QgfCAxNjggKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNTkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZGV4LnJzdA0K
PiBpbmRleCAyYzE1NGUxOGIzN2QuLjg2OGVmZTExYmI5ZCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL2luZGV4LnJzdA0KPiBAQCAtMSwzNCArMSwxODQgQEANCj4g
Ky4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsNCj4gIC4uIHJhdzo6IGxh
dGV4DQo+DQo+ICAgICAgICAgXHJlbmV3Y29tbWFuZFx0aGVzZWN0aW9uKg0KPiAgICAgICAgIFxy
ZW5ld2NvbW1hbmRcdGhlc3Vic2VjdGlvbioNCj4NCj4gKy4uIF9saW51eF9kb2Nfemg6DQo+ICsN
Cj4gIOS4reaWh+e/u+ivkQ0KPiAgPT09PT09PT0NCj4NCj4gLei/meS6m+aJi+WGjOWMheWQq+ac
ieWFs+WmguS9leW8gOWPkeWGheaguOeahOaVtOS9k+S/oeaBr+OAguWGheaguOekvuWMuumdnuW4
uOW6nuWkp++8jOS4gOW5tOS4i+adpeacieaVsOWNg+WQjeW8gOWPkQ0KPiAt5Lq65ZGY5YGa5Ye6
6LSh54yu44CCIOS4juS7u+S9leWkp+Wei+ekvuWMuuS4gOagt++8jOefpemBk+WmguS9leWujOaI
kOS7u+WKoeWwhuS9v+W+l+abtOaUueWQiOW5tueahOi/h+eoi+WPmOW+l+abtA0KPiAt5Yqg5a65
5piT44CCDQo+DQo+IC3nv7vor5HorqHliJI6DQo+IC3lhoXmoLjkuK3mlofmlofmoaPmrKLov47k
u7vkvZXnv7vor5HmipXnqL/vvIznibnliKvmmK/lhbPkuo7lhoXmoLjnlKjmiLflkoznrqHnkIbl
kZjmjIfljZfpg6jliIbjgIINCj4gKy4uIG5vdGU6Og0KPiArDQo+ICsgICAqKue/u+ivkeiuoeWI
kjoqKg0KPiArICAg5YaF5qC45Lit5paH5paH5qGj5qyi6L+O5Lu75L2V57+76K+R5oqV56i/77yM
54m55Yir5piv5YWz5LqO5YaF5qC455So5oi35ZKM566h55CG5ZGY5oyH5Y2X6YOo5YiG44CCDQo+
ICsNCj4gK+iuuOWPr+ivgeaWh+ahow0KPiArLS0tLS0tLS0tLQ0KPiArDQo+ICvkuIvpnaLnmoTm
lofmoaPku4vnu43kuoZMaW51eOWGheaguOa6kOS7o+eggeeahOiuuOWPr+ivge+8iEdQTHYy77yJ
44CB5aaC5L2V5Zyo5rqQ5Luj56CB5qCR5Lit5q2j56Gu5qCH6K6wDQo+ICvljZXkuKrmlofku7bn
moTorrjlj6/or4HjgIHku6Xlj4rmjIflkJHlrozmlbTorrjlj6/or4HmlofmnKznmoTpk77mjqXj
gIINCj4gKw0KPiArKiBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL2xp
Y2Vuc2UtcnVsZXMucnN0DQo+ICsNCj4gK+eUqOaIt+aWh+ahow0KPiArLS0tLS0tLS0NCj4gKw0K
PiAr5LiL6Z2i55qE5omL5YaM5piv5Li65YaF5qC455So5oi357yW5YaZ55qE4oCU4oCU5Y2z6YKj
5Lqb6K+V5Zu+6K6p5a6D5Zyo57uZ5a6a57O757uf5LiK5Lul5pyA5L2z5pa55byP5bel5L2c55qE
DQo+ICvnlKjmiLfjgIINCj4NCj4gIC4uIHRvY3RyZWU6Og0KPiAgICAgOm1heGRlcHRoOiAyDQo+
DQo+ICAgICBhZG1pbi1ndWlkZS9pbmRleA0KPiArDQo+ICtUT0RPTGlzdDoNCj4gKw0KPiArKiBr
YnVpbGQvaW5kZXgNCj4gKw0KPiAr5Zu65Lu255u45YWz5paH5qGjDQo+ICstLS0tLS0tLS0tLS0N
Cj4gKw0KPiAr5LiL5YiX5paH5qGj5o+P6L+w5LqG5YaF5qC46ZyA6KaB55qE5bmz5Y+w5Zu65Lu2
55u45YWz5L+h5oGv44CCDQo+ICsNCj4gK1RPRE9MaXN0Og0KPiArDQo+ICsqIGZpcm13YXJlLWd1
aWRlL2luZGV4DQo+ICsqIGRldmljZXRyZWUvaW5kZXgNCj4gKw0KPiAr5bqU55So56iL5bqP5byA
5Y+R5Lq65ZGY5paH5qGjDQo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICvnlKjmiLfn
qbrpl7RBUEnmiYvlhozmtrXnm5bkuobmj4/ov7DlupTnlKjnqIvluo/lvIDlj5HkurrlkZjlj6/o
p4HlhoXmoLjmjqXlj6PmlrnpnaLnmoTmlofmoaPjgIINCj4gKw0KPiArVE9ET2xpc3Q6DQo+ICsN
Cj4gKyogdXNlcnNwYWNlLWFwaS9pbmRleA0KPiArDQo+ICvlhoXmoLjlvIDlj5HnroDku4sNCj4g
Ky0tLS0tLS0tLS0tLQ0KPiArDQo+ICvov5nkupvmiYvlhozljIXlkKvmnInlhbPlpoLkvZXlvIDl
j5HlhoXmoLjnmoTmlbTkvZPkv6Hmga/jgILlhoXmoLjnpL7ljLrpnZ7luLjlup7lpKfvvIzkuIDl
ubTkuIvmnaXmnInmlbDljYPlkI0NCj4gK+W8gOWPkeS6uuWRmOWBmuWHuui0oeeMruOAguS4juS7
u+S9leWkp+Wei+ekvuWMuuS4gOagt++8jOefpemBk+WmguS9leWujOaIkOS7u+WKoeWwhuS9v+W+
l+abtOaUueWQiOW5tueahOi/h+eoiw0KPiAr5Y+Y5b6X5pu05Yqg5a655piT44CCDQo+ICsNCj4g
Ky4uIHRvY3RyZWU6Og0KPiArICAgOm1heGRlcHRoOiAyDQo+ICsNCj4gICAgIHByb2Nlc3MvaW5k
ZXgNCj4gICAgIGRldi10b29scy9pbmRleA0KPiAgICAgZG9jLWd1aWRlL2luZGV4DQo+ICAgICBr
ZXJuZWwtaGFja2luZy9pbmRleA0KPiAtICAgZmlsZXN5c3RlbXMvaW5kZXgNCj4gLSAgIGFybTY0
L2luZGV4DQo+IC0gICBzb3VuZC9pbmRleA0KPiArDQo+ICtUT0RPTGlzdDoNCj4gKw0KPiArKiB0
cmFjZS9pbmRleA0KPiArKiBtYWludGFpbmVyL2luZGV4DQo+ICsqIGZhdWx0LWluamVjdGlvbi9p
bmRleA0KPiArKiBsaXZlcGF0Y2gvaW5kZXgNCj4gKyogcnVzdC9pbmRleA0KPiArDQo+ICvlhoXm
oLhBUEnmlofmoaMNCj4gKy0tLS0tLS0tLS0tDQo+ICsNCj4gK+S7peS4i+aJi+WGjOS7juWGheag
uOW8gOWPkeS6uuWRmOeahOinkuW6puivpue7huS7i+e7jeS6hueJueWumueahOWGheaguOWtkOez
u+e7n+aYr+WmguS9leW3peS9nOeahOOAgui/memHjOeahA0KPiAr5aSn6YOo5YiG5L+h5oGv6YO9
5piv55u05o6l5LuO5YaF5qC45rqQ5Luj56CB6I635Y+W55qE77yM5bm25qC55o2u6ZyA6KaB5re7
5Yqg6KGl5YWF5p2Q5paZ77yI5oiW6ICF6Iez5bCR5piv5ZyoDQo+ICvmiJHku6zorr7ms5Xmt7vl
iqDnmoTml7blgJnigJTigJTlj6/og73kuI3mmK/miYDmnInnmoTpg73mmK/mnInpnIDopoHnmoTv
vInjgIINCj4gKw0KPiArLi4gdG9jdHJlZTo6DQo+ICsgICA6bWF4ZGVwdGg6IDINCj4gKw0KPiAg
ICAgY3B1LWZyZXEvaW5kZXgNCj4gLSAgIG1pcHMvaW5kZXgNCj4gICAgIGlpby9pbmRleA0KPiAr
ICAgc291bmQvaW5kZXgNCj4gKyAgIGZpbGVzeXN0ZW1zL2luZGV4DQo+ICsNCj4gK1RPRE9MaXN0
Og0KPiArDQo+ICsqIGRyaXZlci1hcGkvaW5kZXgNCj4gKyogY29yZS1hcGkvaW5kZXgNCj4gKyog
bG9ja2luZy9pbmRleA0KPiArKiBhY2NvdW50aW5nL2luZGV4DQo+ICsqIGJsb2NrL2luZGV4DQo+
ICsqIGNkcm9tL2luZGV4DQo+ICsqIGlkZS9pbmRleA0KPiArKiBmYi9pbmRleA0KPiArKiBmcGdh
L2luZGV4DQo+ICsqIGhpZC9pbmRleA0KPiArKiBpMmMvaW5kZXgNCj4gKyogaXNkbi9pbmRleA0K
PiArKiBpbmZpbmliYW5kL2luZGV4DQo+ICsqIGxlZHMvaW5kZXgNCj4gKyogbmV0bGFiZWwvaW5k
ZXgNCj4gKyogbmV0d29ya2luZy9pbmRleA0KPiArKiBwY21jaWEvaW5kZXgNCj4gKyogcG93ZXIv
aW5kZXgNCj4gKyogdGFyZ2V0L2luZGV4DQo+ICsqIHRpbWVycy9pbmRleA0KPiArKiBzcGkvaW5k
ZXgNCj4gKyogdzEvaW5kZXgNCj4gKyogd2F0Y2hkb2cvaW5kZXgNCj4gKyogdmlydC9pbmRleA0K
PiArKiBpbnB1dC9pbmRleA0KPiArKiBod21vbi9pbmRleA0KPiArKiBncHUvaW5kZXgNCj4gKyog
c2VjdXJpdHkvaW5kZXgNCj4gKyogY3J5cHRvL2luZGV4DQo+ICsqIHZtL2luZGV4DQo+ICsqIGJw
Zi9pbmRleA0KPiArKiB1c2IvaW5kZXgNCj4gKyogUENJL2luZGV4DQo+ICsqIHNjc2kvaW5kZXgN
Cj4gKyogbWlzYy1kZXZpY2VzL2luZGV4DQo+ICsqIHNjaGVkdWxlci9pbmRleA0KPiArKiBtaGkv
aW5kZXgNCj4gKw0KPiAr5L2T57O757uT5p6E5peg5YWz5paH5qGjDQo+ICstLS0tLS0tLS0tLS0t
LS0tDQo+ICsNCj4gK1RPRE9MaXN0Og0KPiArDQo+ICsqIGFzbS1hbm5vdGF0aW9ucw0KPiArDQo+
ICvnibnlrprkvZPns7vnu5PmnoTmlofmoaMNCj4gKy0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiAr
Li4gdG9jdHJlZTo6DQo+ICsgICA6bWF4ZGVwdGg6IDINCj4gKw0KPiArICAgbWlwcy9pbmRleA0K
PiArICAgYXJtNjQvaW5kZXgNCj4gICAgIHJpc2N2L2luZGV4DQo+DQo+ICtUT0RPTGlzdDoNCj4g
Kw0KPiArKiBhcm0vaW5kZXgNCj4gKyogaWE2NC9pbmRleA0KPiArKiBtNjhrL2luZGV4DQo+ICsq
IG5pb3MyL2luZGV4DQo+ICsqIG9wZW5yaXNjL2luZGV4DQo+ICsqIHBhcmlzYy9pbmRleA0KPiAr
KiBwb3dlcnBjL2luZGV4DQo+ICsqIHMzOTAvaW5kZXgNCj4gKyogc2gvaW5kZXgNCj4gKyogc3Bh
cmMvaW5kZXgNCj4gKyogeDg2L2luZGV4DQo+ICsqIHh0ZW5zYS9pbmRleA0KPiArDQo+ICvlhbbk
u5bmlofmoaMNCj4gKy0tLS0tLS0tDQo+ICsNCj4gK+acieWHoOS7veacquaOkuW6j+eahOaWh+ah
o+S8vOS5juS4jemAguWQiOaUvuWcqOaWh+aho+eahOWFtuS7lumDqOWIhu+8jOaIluiAheWPr+iD
vemcgOimgei/m+ihjOS4gOS6m+iwg+aVtOWSjC/miJYNCuWSjC/miJbvvJ8NCmVtbW3igKbigKYg
Y2FuIHlvdSByZW1vdmUgb25lPyBPciBzcGxpdCBpbnRvIHR3byBzZW50ZW5jZXPvvJ86KQ0KPiAr
6L2s5o2i5Li6cmVTdHJ1Y3R1cmVUZXh05qC85byP77yM5Lmf5pyJ5Y+v6IO95aSq5pen44CCDQo+
ICsNCj4gK1RPRE9MaXN0Og0KPiArDQo+ICsqIHN0YWdpbmcvaW5kZXgNCj4gKyogd2F0Y2hfcXVl
dWUNCj4gKw0KPiAg55uu5b2V5ZKM6KGo5qC8DQo+ICAtLS0tLS0tLS0tDQo+DQo+DQo+IC0tDQo+
IDIuMTEuMA0KPg0KDQpUaGFua3MsDQoNCllhbnRlbmcNCg==
