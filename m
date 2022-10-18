Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991FFC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 18 Oct 2022 02:22:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbiJRCWa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Oct 2022 22:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbiJRCW2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Oct 2022 22:22:28 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE4AC923FF
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 19:22:19 -0700 (PDT)
Received: from loongson.cn (unknown [209.85.166.46])
        by gateway (Coremail) with SMTP id _____8CxLdnXDU5jPj4AAA--.1535S3;
        Tue, 18 Oct 2022 10:22:16 +0800 (CST)
Received: from mail-io1-f46.google.com (unknown [209.85.166.46])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Axf+DVDU5jmmMAAA--.1650S3;
        Tue, 18 Oct 2022 10:22:14 +0800 (CST)
Received: by mail-io1-f46.google.com with SMTP id y80so10698821iof.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 19:22:14 -0700 (PDT)
X-Gm-Message-State: ACrzQf3Rvr5JYLn4TOCEzUgbE3hiljIoUWpBXjGwIkag+hA4sSGRAc5Q
        n1p4NNWAjU+EwuEQO31Uym9muGY19nOGM80LYsQ=
X-Google-Smtp-Source: AMsMyM5MiOApcPbQdsJ4fUeXb5CBW1ckWTA1XHKxRr6aW7FzJtI7wcHGy94Qcv4aK3P4T87OIMfjObDkCPy0Q8h/PGU=
X-Received: by 2002:a05:6638:160d:b0:363:ef26:311d with SMTP id
 x13-20020a056638160d00b00363ef26311dmr764348jas.241.1666059733014; Mon, 17
 Oct 2022 19:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665130536.git.zhoubinbin@loongson.cn> <d52639f0fb22ae941137d5c478cd021799182b5f.1665130536.git.zhoubinbin@loongson.cn>
 <Y02EcgD3E0/lML5H@bobwxc.mipc>
In-Reply-To: <Y02EcgD3E0/lML5H@bobwxc.mipc>
From:   Binbin Zhou <zhoubinbin@loongson.cn>
Date:   Tue, 18 Oct 2022 10:22:01 +0800
X-Gmail-Original-Message-ID: <CAMpQs4K9Xk58rRss13mKz+amDGQjWiwMREQbLJH-H3LoaUApuQ@mail.gmail.com>
Message-ID: <CAMpQs4K9Xk58rRss13mKz+amDGQjWiwMREQbLJH-H3LoaUApuQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs/zh_CN: core-api: Add timekeeping Chinese translation
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>,
        Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID: AQAAf8Axf+DVDU5jmmMAAA--.1650S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxtrW7ArW8XF1UGrW3JryDGFg_yoW7WF17pa
        y3Kas3GanFyrW5CF4Igr4DWFnrKrZ7CF4UJ3s2g340kr4qyFyktr4jkryFgryxGrWvyF40
        vayxtr1a9r12yrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bBkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2vj
        6VCEFcxC0VAYjxAxZF0EFcxC0VAYjxAxZF0Ew4CEw7xC0VCjxxvEa2IrM2AIxVAIcxkEcV
        Aq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40E
        x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
        0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFcxC0VAYjxAxZF0Ew4CEw7xC0wACY4xI67k04243
        AVC20s07MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
        AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
        c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
        AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
        Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JwCE64xvF2IEb7IF0Fy7YxBIdaVFxhVjvj
        DU0xZFpf9x07UF9a9UUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGkgWGlhbmdDaGVuZzoNCg0KT24gVHVlLCBPY3QgMTgsIDIwMjIgYXQgMTI6MzggQU0gV3UgWGlh
bmdDaGVuZyA8d3UueGlhbmdjaGVuZ0BsaW51eC5kZXY+IHdyb3RlOg0KPg0KPiA+IFRyYW5zbGF0
ZSBjb3JlLWFwaS90aW1la2VlcGluZy5yc3QgaW50byBDaGluZXNlLg0KPiA+DQo+ID4gTGFzdCBF
bmdsaXNoIHZlcnNpb24gdXNlZDoNCj4gPg0KPiA+IGNvbW1pdCAzZGM2ZmZhZTJkYTIgKCJ0aW1l
a2VlcGluZzogSW50cm9kdWNlIGZhc3QgYWNjZXNzb3IgdG8gY2xvY2sgdGFpIikuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCaW5iaW4gWmhvdSA8emhvdWJpbmJpbkBsb29uZ3Nvbi5jbj4NCj4g
PiAtLS0NCj4gPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pbmRleC5yc3QgICAg
IHwgICAyICstDQo+ID4gIC4uLi96aF9DTi9jb3JlLWFwaS90aW1la2VlcGluZy5yc3QgICAgICAg
ICAgICB8IDE3MiArKysrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNzMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvdGltZWtlZXBpbmcucnN0DQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29y
ZS1hcGkvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1h
cGkvaW5kZXgucnN0DQo+ID4gaW5kZXggMjFkMGIyNWJjNTgwLi5kMDgwOTEwMzYwNjYgMTAwNjQ0
DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaW5k
ZXgucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1h
cGkvaW5kZXgucnN0DQo+ID4gQEAgLTQ5LDEyICs0OSwxMiBAQA0KPiA+ICAgICBnZW5lcmljLXJh
ZGl4LXRyZWUNCj4gPiAgICAgcGFja2luZw0KPiA+ICAgICB0aGlzX2NwdV9vcHMNCj4gPiArICAg
dGltZWtlZXBpbmcNCj4gPg0KPiA+ICBUb2RvbGlzdDoNCj4gPg0KPiA+DQo+ID4NCj4gPiAtICAg
dGltZWtlZXBpbmcNCj4gPiAgICAgZXJyc2VxDQo+ID4NCj4gPiAg5bm25Y+R5Y6f6K+tDQo+ID4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL3Rp
bWVrZWVwaW5nLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBp
L3RpbWVrZWVwaW5nLnJzdA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAw
MDAwMDAwMDAwLi5lN2Y5YWRmMjUyNWMNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvdGltZWtlZXBpbmcucnN0DQo+
ID4gQEAgLTAsMCArMSwxNzIgQEANCj4gPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjArDQo+ID4gKw0KPiA+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QN
Cj4gPiArDQo+ID4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS90aW1la2VlcGlu
Zy5yc3QNCj4gPiArDQo+ID4gKzrnv7vor5E6DQo+ID4gKw0KPiA+ICsg5ZGo5b2s5b2sIEJpbmJp
biBaaG91IDx6aG91YmluYmluQGxvb25nc29uLmNuPg0KPiA+ICsNCj4gPiAra3RpbWXorr/pl67l
magNCj4gPiArPT09PT09PT09PT0NCj4gPiArDQo+ID4gK+iuvuWkh+mpseWKqOeoi+W6j+WPr+S7
peS9v+eUqGt0aW1lX2dldCgp5ZKMbGludXgvdGltZWtlZXBpbmcuaOS4reWjsOaYjueahOiuuOWk
muebuOWFs+WHveaVsOivu+WPluW9k+WJjQ0KPiA+ICvml7bpl7TjgILmoLnmja7nu4/pqozvvIzl
poLmnpzkuKTogIXpg73lkIzmoLfpgILlkIjnibnlrprnlKjkvovvvIzliJnkvb/nlKjlkI3np7Do
voPnn63nmoTorr/pl67lmajkvJjkuo7lkI3np7DovoPplb/nmoQNCj4gPiAr6K6/6Zeu5Zmo44CC
DQo+DQo+IOWmguaenOS4pOS4quiuv+mXruWZqOmDvemAgueUqOS6juafkOS4gOeUqOS+i++8jOWI
meS9v+eUqOWQjeensOi+g+efreeahOmCo+S4quOAgg0KT2suLi4uDQo+DQo+ID4gKw0KPiA+ICvl
n7rkuo5rdGltZV9055qE5Z+656GA5o6l5Y+jDQo+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiA+ICsNCj4gPiAr5o6o6I2Q55qE5pyA566A5Y2V5b2i5byP6L+U5Zue5LiN6YCP5piO55qEa3Rp
bWVfdO+8jOWFtuWPmOS9k+i/lOWbnuS4jeWQjOaXtumSn+WPguiAg+eahOaXtumXtO+8mg0KPiA+
ICsNCj4gPiArLi4gYzpmdW5jdGlvbjo6IGt0aW1lX3Qga3RpbWVfZ2V0KCB2b2lkICkNCj4gPiAr
DQo+ID4gKyAgICAgQ0xPQ0tfTU9OT1RPTklDDQo+ICBeDQo+ICB0YWINCj4NCj4gPiArDQo+ID4g
KyAgICAgICAg5a+55Y+v6Z2g55qE5pe26Ze05oiz5ZKM5YeG56Gu5rWL6YeP55+t55qE5pe26Ze0
6Ze06ZqU5b6I5pyJ55So44CC5Zyo57O757uf5ZCv5Yqo5pe25ZCv5Yqo77yM5L2G5Zyo5oyC6LW3
5pe2DQo+ID4gKyAgICAgICAg5YGc5q2i44CCDQo+ICBeXl5eXl5eXg0KPiAgc3BhY2VzDQo+ICBj
aGVjayBhbGwgb2YgdGhlbQ0KDQpJIHdpbGwgY2hlY2sgYWxsIG9mIHRoZW0gYW5kIHJlcGxhY2Ug
c3BhY2VzIHdpdGggdGFicy4NCj4NCj4gPiArDQo+ID4gKy4uIGM6ZnVuY3Rpb246OiBrdGltZV90
IGt0aW1lX2dldF9ib290dGltZSggdm9pZCApDQo+ID4gKw0KPiA+ICsgICAgIENMT0NLX0JPT1RU
SU1FDQo+ID4gKw0KPiA+ICsgICAgICAgIOS4jmt0aW1lX2dldCgp57G75Ly877yM5L2G5Zyo5oyC
6LW35pe25LiN5Lya5YGc5q2i44CC6L+Z5Y+v5Lul55So5LqO5L6L5aaC6ZyA6KaB5Zyo5oyC6LW3
5pON5L2c5Lit5LiO5YW2DQo+ID4gKyAgICAgICAg5LuW6K6h566X5py65ZCM5q2l55qE5a+G6ZKl
6L+H5pyf5pe26Ze044CCDQo+ID4gKw0KPiA+ICsuLiBjOmZ1bmN0aW9uOjoga3RpbWVfdCBrdGlt
ZV9nZXRfcmVhbCggdm9pZCApDQo+ID4gKw0KPiA+ICsgICAgIENMT0NLX1JFQUxUSU1FDQo+ID4g
Kw0KPiA+ICsgICAgICAgIOS9v+eUqOWNj+iwg+S4lueVjOaXtihVVEMp6L+U5Zue55u45a+55LqO
MTk3MOW5tOW8gOWni+eahFVOSVjnuqrlhYPnmoTml7bpl7TvvIzkuI7nlKjmiLfnqbrpl7TnmoQN
Cj4gPiArICAgICAgICBnZXR0aW1lb2ZkYXkoKeebuOWQjOOAguivpeWHveaVsOeUqOS6juaJgOac
iemcgOimgeWcqOmHjeWQr+aXtuaMgee7reWtmOWcqOeahOaXtumXtOaIs++8jOavlOWmgg0KPiA+
ICsgICAgICAgIGlub2Rl5pe26Ze077yM5L2G5bqU6YG/5YWN5Zyo5YaF6YOo5L2/55So77yM5Zug
5Li65a6D5Y+v6IO955Sx5LqO6Zew56eS5pu05paw5ZKM5p2l6Ieq55So5oi356m66Ze055qETlRQ
DQo+ID4gKyAgICAgICAg6LCD5pW0c2V0dGltZW9mZGF5KCnmk43kvZzogIzlkJHlkI7ot7Povazj
gIINCj4gPiArDQo+ID4gKy4uIGM6ZnVuY3Rpb246OiBrdGltZV90IGt0aW1lX2dldF9jbG9ja3Rh
aSggdm9pZCApDQo+ID4gKw0KPiA+ICsgICAgICBDTE9DS19UQUkNCj4gPiArDQo+ID4gKyAgICAg
ICAg5LiOa3RpbWVfZ2V0X3JlYWwoKeexu+S8vO+8jOS9huS9v+eUqOWbvemZheWOn+WtkOaXtihU
QUkp5L2c5Li65Y+C6ICD6ICM5LiN5pivVVRD77yM5Lul6YG/5YWN5ZyoDQo+ID4gKyAgICAgICAg
6Zew56eS5pu05paw5pe26Lez6L2s44CC6L+Z5Zyo5YaF5qC45Lit5b6I5bCR5pyJ55So44CCDQo+
ID4gKw0KPiA+ICsuLiBjOmZ1bmN0aW9uOjoga3RpbWVfdCBrdGltZV9nZXRfcmF3KCB2b2lkICkN
Cj4gPiArDQo+ID4gKyAgICAgQ0xPQ0tfTU9OT1RPTklDX1JBVw0KPiA+ICsNCj4gPiArICAgICAg
ICDkuI5rdGltZV9nZXQoKeexu+S8vO+8jOS9huS7peS4juehrOS7tuaXtumSn+a6kOebuOWQjOea
hOmAn+eOh+i/kOihjO+8jOaXoOmcgOmSiOWvueaXtumSn+a8guenu+i/m+ihjOiwgw0KPiA+ICsg
ICAgICAgIOaVtChOVFAp44CC6L+Z5Zyo5YaF5qC45Lit5Lmf5b6I5bCR6ZyA6KaB44CCDQo+DQo+
IOayoeaciemSiOWvueaXtumSn+a8guenu+i/m+ihjOeahOiwg+aVtChOVFAp44CCDQoNCk9LLi4u
Lg0KPg0KPiA+ICsNCj4gPiAr57qz56eS77yMdGltZXNwZWM2NOWSjOenkumSn+eahOi+k+WHug0K
PiA+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICvlr7nkuo7kuIro
v7DmiYDmnInmg4XlhrXvvIzku6XkuIvlh73mlbDlj5jkvZPkvJrmoLnmja7nlKjmiLfnmoTopoHm
sYLku6XkuI3lkIznmoTmoLzlvI/ov5Tlm57ml7bpl7TvvJoNCj4gPiArDQo+ID4gKy4uIGM6ZnVu
Y3Rpb246OiB1NjQga3RpbWVfZ2V0X25zKCB2b2lkICkNCj4gPiArICAgICAgICAgICAgIHU2NCBr
dGltZV9nZXRfYm9vdHRpbWVfbnMoIHZvaWQgKQ0KPiA+ICsgICAgICAgICAgICAgdTY0IGt0aW1l
X2dldF9yZWFsX25zKCB2b2lkICkNCj4gPiArICAgICAgICAgICAgIHU2NCBrdGltZV9nZXRfY2xv
Y2t0YWlfbnMoIHZvaWQgKQ0KPiA+ICsgICAgICAgICAgICAgdTY0IGt0aW1lX2dldF9yYXdfbnMo
IHZvaWQgKQ0KPiA+ICsNCj4gPiArICAgICAgICDkuI7mma7pgJrnmoRrdGltZV9nZXTlh73mlbDn
m7jlkIzvvIzkvYbov5Tlm57lkIToh6rml7bpkp/lj4LogIPkuK3nmoR1NjTnurPnp5LmlbDvvIzo
v5nlr7nmn5DkupvosIPnlKgNCj4gPiArICAgICAgICDogIXmnaXor7Tlj6/og73mm7Tmlrnkvr/j
gIINCj4gPiArDQo+ID4gKy4uIGM6ZnVuY3Rpb246OiB2b2lkIGt0aW1lX2dldF90czY0KCBzdHJ1
Y3QgdGltZXNwZWM2NCAqICkNCj4gPiArICAgICAgICAgICAgIHZvaWQga3RpbWVfZ2V0X2Jvb3R0
aW1lX3RzNjQoIHN0cnVjdCB0aW1lc3BlYzY0ICogKQ0KPiA+ICsgICAgICAgICAgICAgdm9pZCBr
dGltZV9nZXRfcmVhbF90czY0KCBzdHJ1Y3QgdGltZXNwZWM2NCAqICkNCj4gPiArICAgICAgICAg
ICAgIHZvaWQga3RpbWVfZ2V0X2Nsb2NrdGFpX3RzNjQoIHN0cnVjdCB0aW1lc3BlYzY0ICogKQ0K
PiA+ICsgICAgICAgICAgICAgdm9pZCBrdGltZV9nZXRfcmF3X3RzNjQoIHN0cnVjdCB0aW1lc3Bl
YzY0ICogKQ0KPiA+ICsNCj4gPiArICAgICAgICDlkIzkuIrvvIzkvYbov5Tlm57nmoTmmK8nc3Ry
dWN0IHRpbWVzcGVjNjQn5Lit55qE5pe26Ze077yM5YiG5Li656eS5ZKM57qz56eS44CC6L+Z5Y+v
5Lul6YG/5YWN5Zyo5omTDQo+ID4gKyAgICAgICAg5Y2w5pe26Ze05pe277yM5oiW5Zyo5bCG5YW2
5Lyg6YCS5Yiw5pyf5pyb5pyJJ3RpbWVzcGVjJ+aIlid0aW1ldmFsJ+e7k+aehOeahOWklumDqOaO
peWPo+aXtu+8jOi/m+ihjA0KPg0KPiDnu5PmnoQgLT4g57uT5p6E5L2TDQpPSy4uLg0KDQpUaGFu
a3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQpCaW5iaW4NCj4NCj4gVGhhbmtzLA0KPiAgICAgICAgIFd1
DQo=

