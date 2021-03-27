Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE96C433DB
	for <linux-doc@archiver.kernel.org>; Sat, 27 Mar 2021 03:14:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A88E561984
	for <linux-doc@archiver.kernel.org>; Sat, 27 Mar 2021 03:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhC0DNf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Mar 2021 23:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhC0DNM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Mar 2021 23:13:12 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9BCC0613AA
        for <linux-doc@vger.kernel.org>; Fri, 26 Mar 2021 20:13:11 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id h13so8422944eds.5
        for <linux-doc@vger.kernel.org>; Fri, 26 Mar 2021 20:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wVhw9ZpbzYbHSfo2XkYZISYLyhmSBU/SDzRv3Gaci2w=;
        b=VWhHjz6PSQlZqkXOiIRDhDD/MQcfYLS7Hi7qHQhV2qP9aUzVFWeBpubvkpBCAx0iMA
         NmfFWCNW9cSgG2Mf478ADnYwHvxx9cZem6QTkR3OcfGljUx+6u8fvVhfubyJbER3sjrt
         AbAiCmpeOdsYTrr0BuG0wu46tYldp3OnZJehApKpnTO9w4F9kOyLJNf94MVNvu8WPbTH
         QffwRvR5QnpQqkxOcT6rSILD/bL99xzf2yGcYbIiULax4O4HChlxQJS5I0UF8JBTAvi7
         wQTIHp0NWvr1ltCcfKo+YcKyN5GSS0nKqNFgV+EmuBIsedIZThh+FKfODayYBr7d+K0/
         h4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wVhw9ZpbzYbHSfo2XkYZISYLyhmSBU/SDzRv3Gaci2w=;
        b=B3LNy0EKNH4+sqs+cNEtGPBZgLutln6WoB7nPM1gKqWekaGVOMNpQC35fvyHCTtZ8P
         xT8Ab7F8P4CCwZYd/lGt/1O1AGolVwOvpOj6A5LbKu1kmN+vq3pJW1xeEoatbfsqvldc
         M9kJIF9751KjtXXxuBMJp5EzJPELNR69tJ3PY9Nuh2J4AhEVcLMNh0aKXFhUUgJ9D4c8
         8kRVBljO/n9PxsuWAWCok/kd4Y4JWwBvWRcSOOUn5JGmUEYNyKBPC5ijFk5zkZ5iufyI
         mzzmMYYeNHtu3BCs48lXAcUOHAdz2wn33af6OFad76yhYUsbL+0Mh9IBNZNaPVuWXocu
         nqsQ==
X-Gm-Message-State: AOAM532Cyf2CJ00wokw1BWC7VeCtCbXsUejiGj4kR+1sQrlSkV9j8FrM
        JqPxDM16gIguWQIfvqYO8UNH2ROOtgO62tpHyyV8VXxLSB4=
X-Google-Smtp-Source: ABdhPJx5URVnXoGC/aq4LoVtd80YI/a1AwBTQctwWL1+lq9fkTCRAuaYLFNE64qMT6mcaVUn4bYSOBw02+9I6+p5jxA=
X-Received: by 2002:aa7:cf14:: with SMTP id a20mr18262310edy.49.1616814790431;
 Fri, 26 Mar 2021 20:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210324150731.4512-1-siyanteng@loongson.cn> <20210324150731.4512-4-siyanteng@loongson.cn>
 <7bba3243-95ff-adf9-151c-e08d06e95187@email.cn>
In-Reply-To: <7bba3243-95ff-adf9-151c-e08d06e95187@email.cn>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Sat, 27 Mar 2021 11:13:01 +0800
Message-ID: <CAEensMw5v5eQPD4cDjw-zXPCCa7xELMw+vJ2G5CJXPL5mXb=Sg@mail.gmail.com>
Subject: Re: [PATCH 3/8] docs/zh_CN: add cpu-freq cpufreq-stats.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, alexs@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0M+aciDI25pel5ZGo5LqUIOS4i+WN
iDEyOjE25YaZ6YGT77yaDQo+DQo+DQo+IOWcqCAyMDIxLzMvMjQgMjM6MDcsIFlhbnRlbmcgU2kg
5YaZ6YGTOg0KPiA+IFRoaXMgcGF0Y2ggdHJhbnNsYXRlcyBEb2N1bWVudGlvbi9jcHUtZnJlcS9j
cHVmcmVxLXN0YXRzLnJzdCBpbnRvIENoaW5lc2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
YW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gLS0tDQo+ID4gICAuLi4vemhf
Q04vY3B1LWZyZXEvY3B1ZnJlcS1zdGF0cy5yc3QgICAgICAgICAgfCAxMzAgKysrKysrKysrKysr
KysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTMwIGluc2VydGlvbnMoKykNCj4gPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jcHUtZnJl
cS9jcHVmcmVxLXN0YXRzLnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL2NwdS1mcmVxL2NwdWZyZXEtc3RhdHMucnN0IGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY3B1ZnJlcS1zdGF0cy5yc3QNCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDIxYTMxN2Q5NjU5
DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2NwdS1mcmVxL2NwdWZyZXEtc3RhdHMucnN0DQo+ID4gQEAgLTAsMCArMSwxMzAgQEAN
Cj4gPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArDQo+ID4gKy4u
IGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+ICsNCj4gPiArOk9yaWdpbmFs
OiA6ZG9jOmAuLi8uLi8uLi9jcHUtZnJlcS9jcHVmcmVxLXN0YXRzYA0KPiA+ICs6VHJhbnNsYXRv
cjogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ICsNCj4gPiArLi4gX2Nu
X2NwdWZyZXEtc3RhdHMucnN0Og0KPiA+ICsNCj4gPiArDQo+ID4gKz09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICtzeXNmcyBDUFVGcmVxIFN0YXRz55qE5LiA
6Iis6K+05piODQo+ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KPiA+ICsNCj4gPiAr55So5oi35L+h5oGvDQo+ID4gKw0KPiA+ICsNCj4gPiAr5L2c6ICFOiBW
ZW5rYXRlc2ggUGFsbGlwYWRpIDx2ZW5rYXRlc2gucGFsbGlwYWRpQGludGVsLmNvbT4NCj4gPiAr
DQo+ID4gKy4uIENvbnRlbnRzDQo+ID4gKw0KPiA+ICsgICAxLiDnroDku4sNCj4gPiArICAgMi4g
5o+Q5L6b55qE57uf6K6h5pWw5o2uKOS4vuS+i+ivtOaYjikNCj4gPiArICAgMy4g6YWN572uY3B1
ZnJlcS1zdGF0cw0KPiA+ICsNCj4gPiArDQo+ID4gKzEuIOeugOS7iw0KPiA+ICs9PT09PT09PT09
PT09PT0NCj4gPiArDQo+ID4gK2NwdWZyZXEtc3RhdHPmmK/kuIDkuKrkuLrmr4/kuKpDUFXmj5Dk
vptDUFXpopHnjofnu5/orqHnmoTpqbHliqjjgIINCj4gPiAr6L+Z5Lqb57uf6K6h5pWw5o2u5Zyo
L3N5c2Zz5Lit5Lul5LiA5aCG5Y+q6K+75o6l5Y+j55qE5b2i5byP5o+Q5L6b44CC6L+Z5Liq5o6l
5Y+j77yI6YWN572u5aW95ZCO77yJ5bCG5Ye6546w5ZyoDQo+IOWcqOmFjee9ruWlveWQjg0KT0sh
DQo+ID4gKy9zeXNmc++8iDxzeXNmcyByb290Pi9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1WC9jcHVm
cmVxL3N0YXRzL++8ieS4rWNwdWZyZXHkuIvnmoTkuIDkuKrljZUNCj4gPiAr54us55qE55uu5b2V
5Lit77yM5o+Q5L6b57uZ5q+P5LiqQ1BV44CCDQo+ID4gK+WQhOenjee7n+iuoeaVsOaNruWwhuWc
qOatpOebruW9leS4i+W9ouaIkOWPquivu+aWh+S7tuOAgg0KPiA+ICsNCj4gPiAr6L+Z5Liq6amx
5Yqo55qE6K6+6K6h5piv54us56uL5LqO5Lu75L2V54m55a6a55qEY3B1ZnJlcV9kcml2ZXLnmoTj
gILlj6/og73lnKjkvaDnmoRDUFXkuIrov5DooYzjgILlm6DmraTvvIzlroPlsIbkuI7miYDmnIkN
Cj4g5q2k6amx5Yqo5piv54us56uL5LqO5Lu75L2V5Y+v6IO96L+Q6KGM5Zyo5L2g5omA55SoQ1BV
5LiK55qE54m55a6aY3B1ZnJlcV9kcml2ZXLogIzorr7orqHnmoTjgIINCk9LIQ0KPiA+ICtjcHVm
cmVxX2RyaXZlcuS4gOi1t+W3peS9nOOAgg0KPiA+ICsNCj4gPiArDQo+ID4gKzIuIOaPkOS+m+ea
hOe7n+iuoeaVsOaNrijkuL7kvovor7TmmI4pDQo+ID4gKz09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gK2NwdWZyZXEgc3RhdHPmj5Dkvpvkuobku6XkuIvn
u5/orqHmlbDmja7vvIjlnKjkuIvpnaLor6bnu4bop6Pph4rvvInjgIINCj4gPiArDQo+ID4gKy0g
IHRpbWVfaW5fc3RhdGUNCj4gPiArLSAgdG90YWxfdHJhbnMNCj4gPiArLSAgdHJhbnNfdGFibGUN
Cj4gPiArDQo+ID4gK+aJgOacieeahOe7n+iuoeaVsOaNruWwhuS7jue7n+iuoempseWKqOiiq+aP
kuWFpeeahOaXtumXtO+8iOaIlue7n+iuoeiiq+mHjee9rueahOaXtumXtO+8ieW8gOWni++8jOWI
sOafkOS4gOe7n+iuoeaVsOaNruiiq+ivu+WPlueahOaXtumXtOS4uuatouOAgg0KPiDmj5LlhaUg
dXNlIOi9veWFpe+8n29yIGFub3RoZXIgYmV0dGVyIHdvcmQ/DQpJIGxpa2UgIui9veWFpSINCk9L
IQ0KPiA+ICvmmL7nhLbvvIznu5/orqHpqbHliqjkuI3kvJrmnInku7vkvZXlhbPkuo7nu5/orqHp
qbHliqjmj5LlhaXkuYvliY3nmoTpopHnjofovazmjaLkv6Hmga/jgIINCj4gPiArDQo+ID4gKzo6
DQo+ID4gKw0KPiA+ICsgICAgPG15c3lzdGVtPjovc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUw
L2NwdWZyZXEvc3RhdHMgIyBscyAtbA0KPiA+ICsgICAgdG90YWwgMA0KPiA+ICsgICAgZHJ3eHIt
eHIteCAgMiByb290IHJvb3QgICAgMCBNYXkgMTQgMTY6MDYgLg0KPiA+ICsgICAgZHJ3eHIteHIt
eCAgMyByb290IHJvb3QgICAgMCBNYXkgMTQgMTU6NTggLi4NCj4gPiArICAgIC0tdy0tLS0tLS0g
IDEgcm9vdCByb290IDQwOTYgTWF5IDE0IDE2OjA2IHJlc2V0DQo+ID4gKyAgICAtci0tci0tci0t
ICAxIHJvb3Qgcm9vdCA0MDk2IE1heSAxNCAxNjowNiB0aW1lX2luX3N0YXRlDQo+ID4gKyAgICAt
ci0tci0tci0tICAxIHJvb3Qgcm9vdCA0MDk2IE1heSAxNCAxNjowNiB0b3RhbF90cmFucw0KPiA+
ICsgICAgLXItLXItLXItLSAgMSByb290IHJvb3QgNDA5NiBNYXkgMTQgMTY6MDYgdHJhbnNfdGFi
bGUNCj4gPiArDQo+ID4gKy0gKipyZXNldCoqDQo+ID4gKw0KPiA+ICvlj6rlhpnlsZ7mgKfvvIzl
j6/nlKjkuo7ph43nva7nu5/orqHorqHmlbDlmajjgILov5nlr7nkuo7or4TkvLDkuI3lkIzosIPo
ioLlmajkuIvnmoTns7vnu5/ooYzkuLrpnZ7luLjmnInnlKjvvIzkuJTml6DpnIDph43lkK/jgIIN
Cj4gPiArDQo+ID4gKw0KPiA+ICstICoqdGltZV9pbl9zdGF0ZSoqDQo+ID4gKw0KPiA+ICvov5nl
sLHnu5nlh7rkuobov5nkuKpDUFXmiYDmlK/mjIHnmoTmr4/kuKrpopHnjofmiYDoirHotLnnmoTm
l7bpl7TjgIJjYXTovpPlh7rnmoTmr4/kuIDooYzpg73kvJrmnIkiPGZyZXF1ZW5jeT4NCj4g5q2k
6aG557uZ5Ye65LqG4oCmDQpPSyENCj4gPiArPHRpbWU+IuWvue+8jOihqOekuui/meS4qkNQVeWc
qDxmcmVxdWVuY3k+5LiK6Iqx6LS55LqGPHRpbWU+5LiqdXNlcnRpbWXljZXkvY3nmoTml7bpl7Tj
gILov5nph4znmoQNCj4gPiArdXNlcnRpbWXljZXkvY3mmK8xMG1T77yI57G75Ly85LqOL3Byb2Pk
uK3ovpPlh7rnmoTlhbbku5bml7bpl7TvvInjgIINCj4gPiArDQo+ID4gKzo6DQo+ID4gKw0KPiA+
ICsgICAgPG15c3lzdGVtPjovc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUwL2NwdWZyZXEvc3Rh
dHMgIyBjYXQgdGltZV9pbl9zdGF0ZQ0KPiA+ICsgICAgMzYwMDAwMCAyMDg5DQo+ID4gKyAgICAz
NDAwMDAwIDEzNg0KPiA+ICsgICAgMzIwMDAwMCAzNA0KPiA+ICsgICAgMzAwMDAwMCA2Nw0KPiA+
ICsgICAgMjgwMDAwMCAxNzI0ODgNCj4gPiArDQo+ID4gKw0KPiA+ICstICoqdG90YWxfdHJhbnMq
Kg0KPiA+ICsNCj4gPiAr57uZ5Ye65LqG6L+Z5LiqQ1BV5LiK6aKR546H6L2s5o2i55qE5oC75qyh
5pWw44CCY2F055qE6L6T5Ye65bCG5pyJ5LiA5Liq5Y2V5LiA55qE6K6h5pWw77yM6L+Z5bCx5piv
6aKR546H6L2s5o2i55qE5oC75pWw44CCDQo+ID4gKw0KPiA+ICs6Og0KPiA+ICsNCj4gPiArICAg
IDxteXN5c3RlbT46L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MC9jcHVmcmVxL3N0YXRzICMg
Y2F0IHRvdGFsX3RyYW5zDQo+ID4gKyAgICAyMA0KPiA+ICsNCj4gPiArLSAqKnRyYW5zX3RhYmxl
KioNCj4gPiArDQo+ID4gK+i/meWwhuaPkOS+m+aJgOaciUNQVemikeeOh+i9rOaNoueahOe7huey
kuW6puS/oeaBr+OAgui/memHjOeahGNhdOi+k+WHuuaYr+S4gOS4quS6jOe7tOefqemYte+8jOWF
tuS4reS4gOS4quadoeebrjxpLCBqPu+8iOesrA0KPiA+ICtp6KGM77yM56ysauWIl++8ieS7o+ih
qOS7jkZyZXFfaeWIsEZyZXFfaueahOi9rOaNouasoeaVsOOAgkZyZXFfaeihjOWSjEZyZXFfauWI
l+mBteW+qumpseWKqOacgOWIneaPkOS+m+e7mWNwdWZyZXENCj4gPiAr5qC455qE6aKR546H6KGo
55qE5o6S5bqP6aG65bqP77yM5Zug5q2k5Y+v5Lul5o6S5bqP77yI5Y2H5bqP5oiW6ZmN5bqP77yJ
5oiW5LiN5o6S5bqP44CCIOi/memHjOeahOi+k+WHuuS5n+WMheWQq+S6huavj+ihjOavj+WIl+ea
hOWunumZhQ0KPiDmjpLliJfpobrluo8NCj8NCj4gPiAr6aKR546H5YC877yM5Lul5L6/5pu05aW9
5Zyw6ZiF6K+744CCDQo+ID4gKw0KPiA+ICvlpoLmnpzovazmjaLooajlpKfkuo5QQUdFX1NJWkXv
vIzor7vlj5bml7blsIbov5Tlm57kuIDkuKotRUZCSUfplJnor6/jgIINCj4gPiArDQo+ID4gKzo6
DQo+ID4gKw0KPiA+ICsgICAgPG15c3lzdGVtPjovc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUw
L2NwdWZyZXEvc3RhdHMgIyBjYXQgdHJhbnNfdGFibGUNCj4gPiArICAgIEZyb20gIDogICAgVG8N
Cj4gPiArICAgICAgICAgOiAgIDM2MDAwMDAgICAzNDAwMDAwICAgMzIwMDAwMCAgIDMwMDAwMDAg
ICAyODAwMDAwDQo+ID4gKyAgICAzNjAwMDAwOiAgICAgICAgIDAgICAgICAgICA1ICAgICAgICAg
MCAgICAgICAgIDAgICAgICAgICAwDQo+ID4gKyAgICAzNDAwMDAwOiAgICAgICAgIDQgICAgICAg
ICAwICAgICAgICAgMiAgICAgICAgIDAgICAgICAgICAwDQo+ID4gKyAgICAzMjAwMDAwOiAgICAg
ICAgIDAgICAgICAgICAxICAgICAgICAgMCAgICAgICAgIDIgICAgICAgICAwDQo+ID4gKyAgICAz
MDAwMDAwOiAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMSAgICAgICAgIDAgICAgICAgICAz
DQo+ID4gKyAgICAyODAwMDAwOiAgICAgICAgIDAgICAgICAgICAwICAgICAgICAgMCAgICAgICAg
IDIgICAgICAgICAwDQo+ID4gKw0KPiA+ICszLiDphY3nva5jcHVmcmVxLXN0YXRzDQo+ID4gKz09
PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gK+imgeWcqOS9oOeahOWGheag
uOS4remFjee9rmNwdWZyZXEtc3RhdHPjgII6Og0KPiByZW1vdmUgdGhlIOKAnOOAguKAnQ0KT0sh
DQo+ID4gKw0KPiA+ICsgICAgIENvbmZpZyBNYWluIE1lbnUNCj4gPiArICAgICAgICAgICAgIFBv
d2VyIG1hbmFnZW1lbnQgb3B0aW9ucyAoQUNQSSwgQVBNKSAgLS0tPg0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBDUFUgRnJlcXVlbmN5IHNjYWxpbmcgIC0tLT4NCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBbKl0gQ1BVIEZyZXF1ZW5jeSBzY2FsaW5nDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgWypdICAgQ1BVIGZyZXF1ZW5jeSB0cmFuc2xhdGlvbiBzdGF0
aXN0aWNzDQo+ID4gKw0KPiA+ICsNCj4gPiArIkNQVSBGcmVxdWVuY3kgc2NhbGluZyIgKENPTkZJ
R19DUFVfRlJFUSkg5bqU6K+l6KKr5ZCv55So5Lul6YWN572uY3B1ZnJlcS1zdGF0c+OAgg0KPiA+
ICsNCj4gPiArIkNQVSBmcmVxdWVuY3kgdHJhbnNsYXRpb24gc3RhdGlzdGljcyIgKENPTkZJR19D
UFVfRlJFUV9TVEFUKeaPkOS+m+S6huWMheaLrA0KPiA+ICt0aW1lX2luX3N0YXRl44CBdG90YWxf
dHJhbnPlkox0cmFuc190YWJsZeeahOe7n+iuoeaVsOaNruOAgg0KPiA+ICsNCj4gPiAr5LiA5pem
5ZCv55So5LqG6L+Z5Liq6YCJ6aG577yM5bm25LiU5L2g55qEQ1BV5pSv5oyBY3B1ZnJlcXVlbmN5
77yM5L2g5bCx5Y+v5Lul5ZyoL3N5c2Zz5Lit55yL5YiwQ1BV6aKR546H57uf6K6h44CCDQo+IFRo
YW5rcyENCj4NClRoYW5rcyENCg0KWWFudGVuZw0K
