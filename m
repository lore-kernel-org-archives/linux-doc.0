Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9C83B2FE1
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811013; cv=pass; b=AQsL4FTVpyFvzjN9Re5yL0C+d69de/tQbQOQX/iqw+yKEV9E/5r8EZ9M80gsSEXU1iB3o6jYpQ4rtiaYSkawrh/+MPztDxZ2aARbmRnCfhQ+vpk8WH/Z6tAhMds7HDA5vj5X9kksk/S9SMAgwKanmkzOXfYOE7MeQnfiY1f02C0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811013; c=relaxed/simple;
	bh=JNyT4oyq9E6Y8A2QB1qYoRnA7vKpjkquviD/jEdVtHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dATme6Ea2W5sQlDUPZ2TJ4uWzv/VTwuZJZo7c7Yt10W9zGtMhpqDA4ixIu0579+nVO1ZKCcTFPUXIidVTzJgkvjoPXLqod0zTaH9jXEoz3vTzK6BA8LY4ceApwxFsvCU/dTw6oOib00enCiNvB3NMwvOUboJ2g/bAYktxDR3mic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YpPpnnm6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PPr8cnbD; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YpPpnnm6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PPr8cnbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777811004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p/dXnEXBOslXDQfMUjznIyWpVKfBg+VR46+JkfIfv78=;
	b=YpPpnnm62glkZRKQE4sNQFUJsRDszqStBvfMWF5UJRB0oRo8J18h3pYWlAiJmBe1j8g00j
	brdDKKA7c8J4wYYZgoZYXIIu7+s9fqd5B6gyVz8pQFI2PtEOAsBR0J+bqllQCmFOqgfmZb
	i5T0vVUtwphzWDc8gjqRB8z9xJWNMgc=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-mGOOt5A2MmKT2N9Gm7NIkg-1; Sun, 03 May 2026 08:23:22 -0400
X-MC-Unique: mGOOt5A2MmKT2N9Gm7NIkg-1
X-Mimecast-MFC-AGG-ID: mGOOt5A2MmKT2N9Gm7NIkg_1777811002
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bd5c421975so45321907b3.3
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 05:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777811002; cv=none;
        d=google.com; s=arc-20240605;
        b=BgOXRJfGEbiMERbNRw61PiaVowdFLHOu0szNCT1UndT7RwcWf1eBeYYiDgCY84K29C
         cgvGW2dpVUocM4MX3omXVagJDeZ3fFrJY8ApOzgrd3eOiskgY7dyrPHyGm2KspHDFTeP
         H/lmwccAXPg88Yv1M1jV1+xkBOgIPASdfbrPay7LNcpxOo6yAE1bVh+rzHQfyMRGsi/c
         giq8YgJ5mpQUFKNbu2RkAenrf4Oej8Ynpudiscj1BkaWyE0wYBKQiMzibQR1iTgRoYj0
         FGVQRlkA/Rju9cMwW7URig4lWqJqLoN8FZS//Sh0AAwK0R36jA8FOGA1b6jINvY/NPDd
         3GeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p/dXnEXBOslXDQfMUjznIyWpVKfBg+VR46+JkfIfv78=;
        fh=9Cx5H9NQEmSmsx+zAP42jHI6Lqdt7x3ipbHUp8T2FcA=;
        b=KOqhX+bSozDa+hI5O8PrRJ8ohItxtHwqe/yNphYpl2oiCFVtJ7EdtCvI3InGTKAFHV
         RBL6cOabdqASGZIKIqGuFNbLsjQvS1ir8u3S81ylM/1nRBdAbWh4cvfwda6s4Vc5iFi7
         29hx8Sbb4foGixLnxgcnJO+aYP1mKes//CtMvSivIAJUyxehJ3bgWd4QksGc6+K3hadU
         Ahgmk2N7WHCYEvTXnHE/dKLU6XSP/zXxyUox5yqxvvHHY2cY3O38j5Gjk83hMyW4ekJZ
         upWgj0L3QtxT/oYuBfH4WazkLRaOYoIwXPV+s/OQavtRa2ukZke37pXKq+bjLmWI4q8H
         FMtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777811002; x=1778415802; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p/dXnEXBOslXDQfMUjznIyWpVKfBg+VR46+JkfIfv78=;
        b=PPr8cnbDjDXFp1kKs1ZPrsQ5fnLk9mFm+77gGieckOj/Ajb9w0OgFH3ODIOMVVN5Na
         QCghlCcHzfYTH6udyVVEs41KzC+hE0FKqv0BIC3TtdVYRW1vWqZYgmg4+wjyNikL02Hp
         YyT65vVRfVy2+FI0IM5mNPFTmP1R0YzzCEpJ2voS8utNVYAeYFZYVtaSVWd0c6tZtzaY
         E6of02l58xiPtxKS5BTNU4j1gUTBR+BHl1AdDcYgk90GZTgyscWhRir5SAo6DtAAGRHp
         rcH72hcEE6eUsJbJ5HUP6iXRtwCJs+Pv4pdoSvkrd2LWXDCI26BF13dl6ElcsBiE6EUi
         nuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777811002; x=1778415802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/dXnEXBOslXDQfMUjznIyWpVKfBg+VR46+JkfIfv78=;
        b=ovHRWL4QUaNC9eFEXqQ/oN2SJmSU3xszRK3/zOcSMQQNH+3P29JC6vcMI+MqmPpyZ3
         wSvfkexFKwT6gOvdQLNaUoWitpy/totG70KML2Bh/MiB+EUANjOFCwbtFQ5yn4KS1DA/
         Y966Zv47fzXS7YNXFW/k0ULg9LNPHl8kcFl93hk4jg297G6p3nN7I+hfBqUNKrTLUCZd
         yQrzJweZHe/zNaQGxuamYZuKs0416mqomq+/9lUngTrF2AHBlKpllh5T8yuDnVM1x+Vy
         WUFg2tvYlBH8stzx5485lvF1VjL3UKHVkcRmcb0OxapHVXpOb/9vMcXQHQdeN8KVGOoL
         TdLg==
X-Gm-Message-State: AOJu0YyHiSzlvesWjqOIYXQZNJhOBR3tsOEIi8igmFncu2HcvNPg2nTB
	Ca+6/nJqrsRbX0BQk58odZmdHR35pI7IUWYoFvuUvWQifHGsW+QneupTXQN01JHQrdn7odW5f4E
	eHlTp2Zh4KMLoShWqlmsxOwsK5dw+qw6mJL6OxSXq9vatMDGw2ttEAyfNuoccmH2XkeM4YOIdTs
	v8c/wrRHU7aoEMAzHZ6BLZIFM7VNhv5fyc41fX
X-Gm-Gg: AeBDieuic8ye+/82/1B6O/C4R+eI/+5UCFD98L6b9JLrQvGd7vq9hZtCRdkv7t6xYd3
	E/ly59aKpr+53UvPj5uwiIA5rwOK02XitIBA6RjkRIkV48KLcWOfjH9yOSpYYfq+vN1MFWoRwZx
	G6p4GLdpetfIXC/qPSeUD+fnQk5a3RolJYvUgFxHzZFM03P/zsLbbf+UJSGNflILJmWr19MTP94
	7AD0KOxvMvmj1k=
X-Received: by 2002:a53:d789:0:b0:652:ddea:1679 with SMTP id 956f58d0204a3-65c3da48ba9mr4711776d50.16.1777811002218;
        Sun, 03 May 2026 05:23:22 -0700 (PDT)
X-Received: by 2002:a53:d789:0:b0:652:ddea:1679 with SMTP id
 956f58d0204a3-65c3da48ba9mr4711719d50.16.1777811001752; Sun, 03 May 2026
 05:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419185750.260784-1-npache@redhat.com> <20260424065828.031775921990de37f83a2468@linux-foundation.org>
In-Reply-To: <20260424065828.031775921990de37f83a2468@linux-foundation.org>
From: Nico Pache <npache@redhat.com>
Date: Sun, 3 May 2026 06:23:31 -0600
X-Gm-Features: AVHnY4JOUrqYQ7pe89RlEK7DBNztOKRfp0pqQ2vs73ofctGb0t3K8NYvkU4AuHg
Message-ID: <CAA1CXcBJFoqDrkQbRE6JnpV-gjfNXe2sUxaCyXPC82h3qk9Jig@mail.gmail.com>
Subject: Re: [PATCH 7.2 v16 00/13] khugepaged: mTHP support
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	anshuman.khandual@arm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, byungchul@sk.com, catalin.marinas@arm.com, 
	cl@gentwo.org, corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jack@suse.cz, jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev, 
	Liam.Howlett@oracle.com, ljs@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"

On 4/24/26 7:58 AM, Andrew Morton wrote:
> On Sun, 19 Apr 2026 12:57:37 -0600 Nico Pache <npache@redhat.com> wrote:
>
>> The following series provides khugepaged with the capability to collapse
>> anonymous memory regions to mTHPs.
>
> Lots of stuff here:
>       https://sashiko.dev/#/patchset/20260419185750.260784-1-npache@redhat.com
>
> It's going to take some time.  Hopefully worthwhile.
>
> As always, it's useful to hear about the usefulness of the AI review.

Ok I went through those! Can you please pull the changes from the
staging branch so I can resend it soon (probably after LSFMM, so no
rush)?

Heres my report:

patch 2 - rather useless as memcg does not have per order/mthp stats

patch 4 - good point, although kinda minor, same as what Usama brought up

patch 5 - either the concern is nonsense or im too dumb to understand
it. Maybe someone else can confirm

Patch 5.2 - Not a real concern (I don't think), given we've already
fully locked down the PTE table, nothing should be able to reach it.
It notes a specific config might be an issue, I will test with that
on.

Patch 9 - was a real concern, and my fault for semi-lazily stripping
out a variable without fully considering the effects. David noted this
too. Good news is that it got the reasoning for why it is bad correct.
Oddly, I did not see a bug during testing which I would expected to
show up in the madvise tests. I just reverted my changes, I will try
to clean this up in a future cleanup series... Although there may be
no good way around this madvise behavior.

Patch 10.1 - Good point, I had considered this during my design, but
then convinced myself I was incorrect. This actually saves us a lot of
heap space :) Gotta retest a lot though. First few tests show no issue

Patch 10.2 - Not a concern and if we made it here, it's already been
checked. Furthermore, the result would be the same. Although not a bad
question from the AI

Patch 10.3 - I dont think this is a valid concern at all

Patch 10.4 - I don't think this is a valid concern at all

Patch 10.5 - The first half is valid (although it's what the next
patch does), so it's not really that valid, it's just missing the
series context. second half hmm

Patch 10.6 - Not a real concern

Patch 11 - Not a bad consideration

Patch 12 - real bug from my last refactor

Patch 12.2 - Decent consideration, but not a real concern, just a design choice.

So yes overall very smart to check sashiko :) But as someone currently
actively working on sashiko I was already a fan.

Cheers,
-- Nico



>

