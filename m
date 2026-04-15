Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE01B30ACE3
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 09:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243949; cv=pass; b=rPvINZOZ1nrThVsHX5nW+dgdBo+dtBnjWfRPlZoyTQ/LWhyMu42QavgKB+ND+QJFosV/0w7wSsC37yqJCO/R+qvyG5xv5yauSOeSf8t1N6p7RQSsiAHCLbdZQnMjQDOdAchcpcZbudHpx2rvBAqXH8M0kjJQNQooFQWasFPKBQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243949; c=relaxed/simple;
	bh=iXI3NB5dwTMBuW93lxMaTw8SX+HzdxywSu/h3/qrP8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLKG/3/xj67Lc8y6IgvEct7up5o/YUpIjI4n9xgdr4Dq1pUmUtIUmfQgs0w90jeRRPRre32zojolM8wIJEEb6/yyxjIA3StfU5k+xydmh/iOWR8v8KH13xaKMWv4CsWbZlnMxnr+d+7A/oDC9YPgIxC8d04ZRG9STDUdTpLAXt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dJ1D1dsJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qu4sx0ON; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dJ1D1dsJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qu4sx0ON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776243947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iXI3NB5dwTMBuW93lxMaTw8SX+HzdxywSu/h3/qrP8M=;
	b=dJ1D1dsJ4aAC4cZzJQUgCzs+lyw+rflOmhv9uE/MqUWFDZm3lI5d549SNLG28fXBOVd4Pc
	/LmoEXCWH2Ms5z2oXLkIf81+j+J1gcUHLOf7XdP20Fowt60ZJwbsaKezCsWEICWBuCLjtX
	NgEsAbwabTmS4K2XtzYyJorLgg17Hkg=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-bd-11lfFNlyCp4TZas4EkA-1; Wed, 15 Apr 2026 05:05:46 -0400
X-MC-Unique: bd-11lfFNlyCp4TZas4EkA-1
X-Mimecast-MFC-AGG-ID: bd-11lfFNlyCp4TZas4EkA_1776243946
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60fd805d912so2091477137.3
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 02:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776243946; cv=none;
        d=google.com; s=arc-20240605;
        b=PJ9ow5DCclp7kRlnkqh4wFalg7Oclv1MBYXWONxFuRP5AmVyageLhX3KoAELxPivxH
         eSvxPYdLYuKgNz/OPkofsaJqhydD6m0OrtqhQeotcwhDfvgCrkYQ98HOkHccc64KKy1R
         ZRtz4LsN83oKTBz09qWrbBrW+51MElQY2EWPb1hxeHdGV3AnmVkyunvhtpnxytySzvMB
         CCD2s1MvS7aDjPTmIFFFRLhxtLLouKjY2cKjwSFGftc3oadZHwOqXAHVDtuZHMtDGFnJ
         PBbhdqG2EpH7ELC8UmrJtUBikbQkmOqp7LPc6h2eXIZ4kvPWXwL8gezLYxA/pPghBwqP
         4y2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iXI3NB5dwTMBuW93lxMaTw8SX+HzdxywSu/h3/qrP8M=;
        fh=Vl+JUUcvHVFbWLUt6FHaZd2OdHBcpVKdafrR7te23Js=;
        b=PqiLJqh/oVyuQdiZ3TTqf0OXXVWLA+PaGDLBI2zRyulV4/Iz3b0b5tiE8VG4sQ3O57
         DPd0OX/NHDqRSodOKL6+hmHMoFutRZrp2Q3/XBo9a8g05+ltP6wEzAmvdcgJb7uBowgd
         q7ii4okmKT50FJg0ETXXYLHl5b9BexByoIbVzFrkQgWdwg82qj1T6FHyy75rO18y4jut
         XY1ddIyWlhtuDVsKF+9xlNa5DdcWAlv78ZEVqtfmXsWpa5hYIfrgtfSzDwgeMBXm4rkz
         dq+JxBXYUNrAnc5rtVDY08mB4FOJaujTdamzLMMcugf2UaiyWaP9HApxHruGY5mA4eTL
         VF6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776243946; x=1776848746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXI3NB5dwTMBuW93lxMaTw8SX+HzdxywSu/h3/qrP8M=;
        b=qu4sx0ON65Cqu0vrwcW5OvEVDrOdt8gxzQfUjKz3hBQUEMaFpelu6VjKZi46RSmEVg
         E4cEZhOCKe3mHdgvwrS0e3T6LH3mNi5+mNPag1Fi5BQtOT+XOyi5NbaawMsyBCvHZV/L
         pV3bSmMgNKY7y8+nEEVn7EFn9mfD6H+cpPv3TRuWwDrA8Q/l1F/m7EDGRrnD9I+ZSI9y
         yD28i8+TIsyc9JIdNeaQKA/rY/RaudUjLDQPtDyaJ08P7qVF++Po7LOvV5GJ1koBCijd
         yeEQCgVPMec8tMfwbLccf4mAW94mkEeLckZiVgDvz8lHbaGMP+AsjrV9svVBW1BGMMNu
         L/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243946; x=1776848746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iXI3NB5dwTMBuW93lxMaTw8SX+HzdxywSu/h3/qrP8M=;
        b=XbiZ8c4qlBtD1iphOZQoVg2Volx8m5St3p79bWBdggfR6akaN32XT5lufMUcLRtVPi
         8/vyRbw/Lf4rjqDnnDv550VZY7CeJTNLZ6NFJdVn2hLdcU4mTGLbW94UGBlt2psX8EaV
         0PpD7jziYOddfNkGlSCIT5NHiwh4zsZuMCFWf43nBP3Gv1raZdrXGiYPARr9syptehnx
         s+AYLKXex8BfaJOIojSYo1ojMjYkZ7yWE+i0D7BrAm4B1NJkLruhRtneFhK5lEG4qq8Z
         dwQrADDrmSYnrSbsxeZCQtMF2e1aHN8lzTA7bXVvT340MYd/NONVQ15CWBb+bLK08uSf
         N6Qg==
X-Gm-Message-State: AOJu0YzFWza7TC4lOV+aLXyhv7DZa8S9s20otV6fm88Oex+aN/siXx/i
	VX5yBocToFnZY4uo7oFA8f1eWCxfOV0VkUAlF2WmclMHM96ovf5JmyOry3SVSqH+qtItjAI55nc
	PW/PPjEuuZnnIwmqDMF+a79RdBzDzGphHbgVhKBhl2agXpqS1frGHOsEHkrELIEqbO4mW52QQlO
	yQtoE2hbj9DC/T/GmuobRWGD2lj0jOxLuYzdpb+KUoYuwbDrxL2EE2
X-Gm-Gg: AeBDieuq22BbkGeaEGvKzDumRy/jbxlZh/aIRJAPUTEhNXhd4sBsGPpuhDpO/yZuOyx
	PNNhITIDsR9LZrEe7ORb3xqRaA2N709qyF6PTvvhJPQazT6Xpybvf6/LdlIgFx5E2VjpH2a98QN
	Hja2OTs9IyRr6tgoGyNPn3cjPJT3sMlt9XdRXB6W9DebGwpWL/e1aGyQAwDUox2JYd5usms3rGm
	U32zLVBQBPkBa5XMtrTCeZ5dN2L7fXI+kUd3EWSE70pDb5HpsM=
X-Received: by 2002:a05:6102:2c0f:b0:610:5b9:dde6 with SMTP id ada2fe7eead31-61005b9e0eamr4768207137.6.1776243945950;
        Wed, 15 Apr 2026 02:05:45 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0f:b0:610:5b9:dde6 with SMTP id
 ada2fe7eead31-61005b9e0eamr4768194137.6.1776243945525; Wed, 15 Apr 2026
 02:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401110232.ET5RxZfl@linutronix.de> <CAFj5m9La5S0B8o677FmHoXkD-N+kMVdJL7Gn1YG5noy_4Q_jxg@mail.gmail.com>
 <20260413155301.yqgpSjX-@linutronix.de>
In-Reply-To: <20260413155301.yqgpSjX-@linutronix.de>
From: Ming Lei <ming.lei@redhat.com>
Date: Wed, 15 Apr 2026 17:05:32 +0800
X-Gm-Features: AQROBzB9KJmwFXhmDmR7OA8JjakLiXVMBQ3cEgs-P_l8vd8464WOWVm8gbPJ1rw
Message-ID: <CAFj5m9JfKsOnipKMwtb67UJuaD_yeqG7afbSHipcerg+kS+A2g@mail.gmail.com>
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, Christoph Hellwig <hch@lst.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Jens Axboe <axboe@fb.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@kernel.org>, Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, John Ogness <john.ogness@linutronix.de>, 
	"Lei, Ming" <tom.leiming@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 11:53=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-04-11 20:18:17 [+0800], Ming Lei wrote:
> > > +CPUs listed in the avoided mask remain part of the interrupt=E2=80=
=99s affinity mask.
> > > +This means that if all non=E2=80=91isolated CPUs go offline while is=
olated CPUs remain
> > > +online, the interrupt will be assigned to one of the isolated CPUs.
> >
> > Maybe you can add:
> >
> > In reality it is fine because IO isn't supposed to submit from isolated=
 CPUs.
>
> You can argue both way. And I have some vague memory that block will
> schedule kworker and there was some work to use unbound worker instead
> of _this_ CPU.

It is actually to rule out isolated cpus from hctx->cpu_mask, please see
blk_mq_map_swqueue().

Also unbound worker won't be scheduled on isolated CPU too, if I
remember correctly.

> I just don't know what happens with interrupt and this is
> probably the one thing you can't configure.

Interrupt control is determined by `irq.effective_affinity`, as shown
in your documentation.
Or you may provide more detail about the question.

Thanks,
Ming

