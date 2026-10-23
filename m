Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785086;
	b=X4/G5CjtcpG1yC6mnGDKE87yG88nXbwKyUtfyR8BJkcT4tMJEvlXRxdezRM0gl0b5t34
	 LFQml+/7EiVLL1gMEpgPMTS5hBmapsT0vEZEMmQhhpvpc7ko914BoexVT4SmYq8wJJATC
	 2blY0IDCtVmTQTvZFt3cInUr3t17k3QiWYTF2s0msXNyrqu9uPrKND5H2WtkkmtDmE+GV
	 gkM2vkF93drT3Q061ofKGdDinf0wO/MLEBVZt6mQSbGBpu5MH6+2iBGzgHQOydA1E2iyZ
	 r5kb0e8q9SQY5JMAr1ZmMjvk0+Mg620zdWA+F4OioqpUA/YSmSirmzsY3ZFQx6z/nKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ajNcFZ5WussjgJU9fT6tDOCdCs4dRuGUCjNnd7n+pgg=;
	b=YF5TPbUU7swgoe95QkP7f8qjSMtnEJiIzF8nJ00v8VyTZfS5TOgOgdj14HjPHU62rNe1
	 ejlDU4r8s7BbrXrp1Sewn7opPwdbbA+5Vc/8emtSQmh840beWwaSnDsxXMY7B0AIkUt/3
	 +isxKj4T4krg9ZpuA1M/f39TXaJOthuI3SZdiyE0kUZUjyNa+R/0pggXrDdIFvIS6Ln+y
	 vOjW7VYPmbJQo/NxOFU1Jlhqd5OTGrkZp+d7YpkCji0iVvPINMH5ljyRyDZTlxGYlAzFR
	 ZP89eZfkNCCep7k7F6AS4bgYqCbZyO+CCcwrvxaeWg6lcIoJ7iRN1TXE0rSPUwrbyIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rgi8KcAW;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F597606A320
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 19:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F597606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rgi8KcAW
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so543962eec.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 12:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792785085; x=1793389885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajNcFZ5WussjgJU9fT6tDOCdCs4dRuGUCjNnd7n+pgg=;
        b=Rgi8KcAWCzMgh/295akadvMJq8jGSIn5rHTXj+B9R3ITqMY/HhYGfFh+61Yr7LZdka
         K2mm3g2/yYSSXO31ttNglo7UmJcPDQD380wL19s/68kACN1UCs8cUm1hn0aWmznP0oSD
         yg+x0pXd+vvkfFS0Y5nWbUpr0J6F9KmcRwpuTon1gKeNA68qGHMH74QUR4XT+5BjhcXB
         5N2Hujr7C41axWt/+JVFLda0/QqlGyl362us92W342wJBgf98302qQw4ByNwnY7cwW8X
         zCnwRb8FKT0/bGi7N8QKnK3qt3p+yvDYNw0uRenugpzU9mwGbr64W36vHOV69UQe1A52
         1dCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785085; x=1793389885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ajNcFZ5WussjgJU9fT6tDOCdCs4dRuGUCjNnd7n+pgg=;
        b=uPxzoyuAZuH3ndBjqQodkJwlS34mWUvjwx4ohUsnbUNZK2j3HBp8QQLb4bpYx8BhI5
         BbLoW4rhdkycIrga4eK6wdjUaldGaAvj/P3Zu3ujdpnu+NVLaafyYHaAuGzaoDgAy1Z3
         r5mmHnhERA/2azZ7TBeq6OHbwOBuTvDSCUYsi4axq5BKFwFalgqSBhYmW5cFA28Oz6/5
         7Z3kDOFKCZFwl0fFXHx914u7KunJrf5yZ+EAPfRGfL5avw0m6PCG5FnIzB9S0FZrkYCo
         dmK1hsz0k56NWvJnPlWY4MQAqo7LuygRA8alM/dK9WHVPxom22f3dumthSdtJVl+wWxB
         kGRg==
X-Forwarded-Encrypted: i=1; AKwUvBz0QvYnqyZ3DaxwoJWvKwKIgEaRzr5tGLvSta8vkGjkzmcDbyZ6F3sYm0F7eYfZVCZKwoQrP3mq8vA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXtnB9ACxwY5z7Ep+19K1dpNptKQHBN0dUeweApefv1xiVK06O
	k2kWFDKMVZj8Q/45Fnbz33cwwXrNL6na6XIYsMIFEZCFn3nhOjX9TI8=
X-Gm-Gg: AYBFou1grq6ssts43/XBLlg7z4rdjl3w15Qm2sPsxE/FNZF5hvGvgdPYyTp/tqR8wlx
	OmBDDU4vwn0FtH7g4spi7jsG0NQbVTLfWM3L7vqKk0nxtZVFFcpTIwydjoMTGk1DM+weQ49OXVg
	tlLMyELNajArpI50OfO+Wv8NbYKvVp45cDOrBRW5Tz5HqJ4WtUFo+iN29aXQ94DgE9aYazLnsiQ
	XpFlEAU5VHvic6+f7CeW71oUJTP9SjWv6yuVjwrTKoWqli3cHI5BgWZSoWJBytttLcaew06wMrS
	A8xtQFUs0xDBgw5tckTKzMqFdCBQ6PV1BL/xQr1q13xcXGrpqkWZZejEZPg43leyjwr3vgMcA2j
	OTPdotGjtoHu7KZYV+9u+soquWkP9IU8jqoVxVLzTHGXyMV1ztWuseUKstK7QLHqKWMrS8A0glA
	LyxdzBctzURCJ0ArqR3vY8tWbguIt3Qi3148cmM1v1i80FKKIif2IST8bkCZUJOFs8TyCalSIRc
	gmtzsQzo8mWUgApm51lxjAifglpRJ4GRiqdWYlmxUy19Vh2t0J6qumbv0CDYcR6xFy+GygcngUW
	Tdf1QF3BQtlV6lRhUNm7n+widGumlwNGKw==
X-Received: by 2002:a05:7300:50c5:b0:368:e6b5:35ad with SMTP id 5a478bee46e88-369e84dab92mr442217eec.12.1792785084531;
        Fri, 23 Oct 2026 12:51:24 -0700 (PDT)
Received: from localhost.localdomain ([137.201.204.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee72c0sm420489eec.29.2026.10.23.12.51.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 12:51:23 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org
Cc: corbet@lwn.net,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Subject: Re: [RFC PATCH v0] Docs/mm/damon/design: document data attributes report infra design (beyond page table accessed-bit milestone 2)
Date: Fri, 23 Oct 2026 12:51:22 -0700
Message-ID: <20261023195122.2481-1-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022052913.90437-1-sj@kernel.org>
References: <20261017195747.89961-1-sj@kernel.org> <20261022041724.2712-1-ravis.opensrc@gmail.com> <20261022052913.90437-1-sj@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ,

On Wed, 21 Oct 2026 22:29:12 -0700 SJ Park <sj@kernel.org> wrote:

> Hi Ravi,
>
> On Wed, 21 Oct 2026 21:17:24 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:
>
[...]
>
> Thank you for your detailed review and testing of the first design!  I'd still
> like to try decoding idea first, mainly for quick prototyping.

Sounds good.  Starting with decode makes sense, especially for VMs
where hardware address-sampling PMUs are often unavailable; some tips
for the prototype are in the other reply [1].

[...]
> > Yes, if the report has an address field with a validity bit and carries
> > the producing report-type (attr) id.  Then IBS, PEBS, Arm SPE (through
> > an adapter, since SPE uses the perf AUX buffer) and device-side
> > monitors all produce the same report, into the same queues and probes.
>
> Thank you for confirming.  And yes, I think we can add more (union) fields to
> the report structure.
>
> However, could you further clarify what are the validity bit and attr id, and
> why those are needed?  I'm still newbie to perf event, please bear in mind with
> me.

Neither is perf-specific:

- Validity bit (or union tag): a way to tell whether a report carries a
  virtual address, a physical address, or both.  For example, a decoded
  sample has no physical address if the page is not mapped.  If you use
  a union with a type field, that already covers it.

- Attr id: an id of the producer (report type) that made the report.  If
  several producers later feed one queue (e.g. perf sampling and a
  device-side monitor), a probe can filter on, or weigh, reports by
  their source.  If each queue only ever has one producer, the queue
  already identifies it, and the field is not needed.

[...]
> > 4. Binary search over a sorted region snapshot (your todo in
> >    kdamond_apply_access_report()) beats a linear walk from about 2
> >    reports per interval for 1,000 regions (a model, to be measured).
>
> Yes, this efficient region-report matching would be important.  We could also
> consider starting with linear walk and later optimize, though.

Agreed; starting with a linear walk for the prototype is fine, and once
it is out, happy to measure where binary search starts to matter.

[...]
> > 5. Samplers can stop silently: in a report on the v4 thread [1], IBS
[...]
> Unfortunately my understanding of perf event is not yet good enough to
> understand this in depth.  I will revisit this after starting implementation.

Sure.  The one part worth keeping in mind from the start: a sampler can
stop without any error, so a counter of reports received and dropped
helps tell "no accesses" from "no samples".

[...]
> >   - The queue: the per-CPU seqcount design in note 2 (suggested), or
> >     ftrace's ring buffer with one iterator per reader.
>
> My current plan is to use DAMON's original simple lockless and global queue per
> report queue.  Let me know if the report queue design is not clearly explaining
> what it would look like, or there is a clear problem.

A global queue is fine to start with, and the design is clear.  One
thing to keep in mind: perf writers run in interrupt or NMI context on
all CPUs at once, and an NMI can arrive in the middle of another write.
So reserving a slot needs to be lock-free, and a reader should not see
a half-written report.  If the design already covers that, there is
nothing to add.

[...]
> As soon as this design discussion is completed, I will start prototype
> implementation and share it as the next RFC version, as soon as possible.  Your
> review and test of the version will be super helpful.  I may also ask you some
> questions for perf event and your prototypes.  Thanks in advance for your help.
>
> There are competing works, though.  It would take time.  I expect about one
> month at minimum.  It might take longer; Thanksgiving holidays could be helpful
> to give me a time to concentrate.  Please bear in mind.  But once the initial
> prototype is implemented, I believe we could quickly iterate and meet the ETA
> (LSFMMBPF'27).

No rush on the timeline; that plan sounds good.  Please feel free to
ask any time, and I will be happy to share the test programs and review
and test the prototype when it is out.

Thanks,
Ravi

[1] https://lore.kernel.org/r/20261023194848.2449-1-ravis.opensrc@gmail.com
