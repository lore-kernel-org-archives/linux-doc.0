Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170453;
	b=txDhDcBJjE19M0rMYAc0HE4PU+AYMMUNYgVkchKwGUgtpRmZVLcVfqusuSIMO8eyzK/H
	 03kiCOm8QQn8y1/e6ErDoQUDubFBc4rKMV+v4DDTc1wAxjvmThl8cKmEzU/cH9Axjlw+D
	 ZzEFDilfROfWuowxgYs8o+sk7vysTbxiWPSFcmMvDl0mi1DttOC9v86utVg+kUAQFSvmq
	 4W0SK2tkgmoxuoh0iHpIcAX8GJEh9eeZq1PMKokrnimJkHA/jcld7+YPbYxQ6WeTGgAp1
	 Wf5VLvAoA0/yBvavblsTsiPAKyDvEqUD7lW5C9wgi+YvPkTJ6drnFbs3HWCBlcvxHlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J03hAPreVl/WdlY67XpnWOO6QMbJJDuPrc/TmqPAXow=;
	b=5bf1zVG9ZPxXbXgBbJIy63H66+aH7imNvUmZL9aTIKWPzLWnsZa9J/plg2BlNE0iD4nR
	 33bvvGf8hkOvIBvVzrVqvwFy2Ta9sze4RBhxIsPTu8dIcH1B8ppA43pszY+No3ccPPbwZ
	 i2pPm3/CQ3LKySMVEpohf8JiXjZ1tsXcD0/MIuZz1DhkSRAjD64AV05c1Eq8jZUOD3Z+B
	 nWify6e925JpdBanK4ghNax9QdCnWAdjf2HRKrw64sTc7faueUiTYI/VEz2TtvN+b60jb
	 Gdhb5TypQ9mZ3CRy/qWr4KEF1CScjbn0eb+tFRRvQ2H9UsXG4nmOQ4jyv+E2HUCIYvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RQSSrIcH;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2178F606A326
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 10:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2178F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RQSSrIcH
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so6242025e9.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 02:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795170451; x=1795775251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J03hAPreVl/WdlY67XpnWOO6QMbJJDuPrc/TmqPAXow=;
        b=RQSSrIcHe3nsThu/qsuyCLRVp6kBKamHvjbg0Wu/b4lbX6CZewJC366PZCYxE40TAB
         6Iy4qlHNGqxtgMz+Y67CO7Pe+PkXP5BwzddMfG0OwvrThdC2iJc1KjRK2nov4QSoIR0v
         YNTEOAIJw81hO88t0rMWbJvNSD2anaMtRYHdCd9dqK6nP4EeSnyQQdvoQnjbteaZRXyM
         4K0TXZt/kJlXBxW6515aaPUhXn3SJcvjfaNqdCyBhRnpjMMsBVY0B+WkU5pR6m16HLAa
         GCewYpObVjoq4lgFJaezb25HUXFm0ujZzRYFYEJ/NjQc3D7bwhwqDPz4Auj0T3IyBaSe
         VeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170451; x=1795775251;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J03hAPreVl/WdlY67XpnWOO6QMbJJDuPrc/TmqPAXow=;
        b=kQ0Z9/xxi+qcT5iBYTymDX8BwurUD3hzPtC7s5e8nv4iwosVlPK3Fg0t51dyjW63X6
         4zmBafb3/MMgXoMuy23WqMxndjfEgGx6a/OmplcDn4oYP88++m86LW+SjBrdd0r6zO87
         bIh0KF2yE6DXzHYqS3KeyuHH070Wtehn0/0o7yTCzuJmGgnOX86+/jAkyn3XX0gZGjur
         wmvtdlZRb+k8C/qQJjJvporFUmrdn4adY0A4rLCMYXyuq5CuoJ8IXBGTqwGmYyTxIubo
         a0rBu/NC79f489ZzM7E7c9Rox1Q8zjgP87eE6ndWFoHgacIEOy4/xs/TVBEIpjFOHig5
         S1Yw==
X-Forwarded-Encrypted: i=1; AL+hErGM9jixqh8cUjAEA1zEFFzNnWdIcSrWmoHKRhbRk+BSYB6rb9DbE4C2z1SF5LzCYjX2OmI85eMb3Kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BRdRBAb210/yIg5oAk8Xj81e7+tXqjUZq2rzkjsh5/1DfIm77
	I0kwSQEyd3e5CBlAlkfRVJHmydHiijR7GD3YXsVcH+Nn77Dc7pLk4QdsX/g8Xo8pZZ8=
X-Gm-Gg: AYBFou1+/75IBgwH2rJWwXoQ7UI9K2i4Rx8QOIViHeTjX+bmpyMWV9a6Jx5dd1G5iZW
	YBRM1ZJD95pQLLI6FkRSNsEYh3UnyaTKeIQbCnsXVefapBwn9wf1KnYtg39yeD49LemCAuIIvrC
	OskoKbGl7duPUkB+z65jpBcgm2Synf0zv1ACouG5SiA81xXhNgf94i191lFO1ih1OHKMU6n6GZi
	O39r7+eBir6ovpm2CZ35w8xpNJ4GXlPS2DVZTOYIP5unEjOG1g3WnKg9aaMLym9xAV0mlEXt/DG
	6p5Rpyl7Q20AQuXIMFnQZ938AzG0Oc+aZ6zBF9amZ6opnSDr1Fk5bX1SX6hbCgD5T61AItdv+4Z
	rw40FRcUuUZB3a2jGRtosWE163oE7muzry2qDeTgGOn8YlTjthl1Wt4PDk8H/WDa8Yz7UVsuUiA
	8NajRVTejE7tezhkE3khnT5wmZSeI8W8u/xpENXwi6ZxC6ANc4D3UzY7u1x3jSuC59VbvwjYU5g
	AfNGsIFfgBJCuNqSVFjYSs2ygSFgk49vK7IT5fZHnXt093aT/nx6M+lT9OTz8Ds0oMVITITIJHC
	f4FabNruQt/FF/SHeoY3
X-Received: by 2002:a05:600c:4ecd:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4bb8881e81cmr57015215e9.29.1795170451305;
        Fri, 20 Nov 2026 02:27:31 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm108779875e9.15.2026.11.20.02.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:27:30 -0800 (PST)
Date: Fri, 20 Nov 2026 11:27:28 +0100
From: Petr Mladek <pmladek@suse.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>, Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>,
	Bradley Morgan <brads@mainlining.org>
Subject: Re: [PATCH v4 4/4] x86/vmware: Report guest crashes after kmsg
 dumpers
Message-ID: <awAgkNoIKpFx764w@pathway>
References: <cover.1794980455.git.zack.rusin@broadcom.com>
 <d0f9c1188b5f78bb20bb43737b3cf80c5c0f94f4.1794980455.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0f9c1188b5f78bb20bb43737b3cf80c5c0f94f4.1794980455.git.zack.rusin@broadcom.com>

Hi,

this patch looks a bit messy, But maybe, I just do not know enough
about VMvare.

On Wed 2026-11-18 01:01:51, Zack Rusin wrote:
> VMware accepts a structured guest-crash event, but a host configured with
> backdoor.coredumpOnCrash may terminate the VM before the hypercall
> returns. Keep this event separate from the log sender, which runs
> earlier in panic.

I am a bit lost here ;-)

What exactly means the "structured guest-crash event"?
Which hypercall are we talking about?

Is this primary about synchronization of vmware_panic_log_notify()
against termination of the crashing guest by the host?
Or is this about something else?

What exactly does vmware_hypercall1(VMWARE_CMD_REPORTGUESTCRASH, 0)?
Does it _block_ or _trigger_ backdoor.coredumpOnCrash?

> Register a panic-only kmsg dumper with late_initcall_sync(), after built-in
> dumpers registered by then.

Is this ordering important?

> Skip the event while a crash kernel is loaded
> so the host cannot terminate the guest before kdump saves its vmcore.

This suggests that vmware_hypercall1(VMWARE_CMD_REPORTGUESTCRASH, 0)
actually triggers the external crash dump procedure made by the host.

> Issue the event at most once. With CONFIG_PRINTK=n, use a late INT_MIN
> panic notifier. An unexpected dumper registration failure with printk
> enabled leaves reporting disabled rather than overtaking working dumpers.

This is another mystery. What do you want to achieve when
CONFIG_PRINTK is not defined, please?

Note that printk() is a NOP when CONFIG_PRINTK is not defined.
There is nothing to dump in this case.

Honestly, I would not complicate the code by this.
I doubt that anyone is using kernel without CONFIG_PRINTK.

> --- a/arch/x86/kernel/cpu/vmware.c
> +++ b/arch/x86/kernel/cpu/vmware.c
> +static int __init vmware_crash_report_init(void)
> +{
> +	int ret;
> +
> +	if (!hypervisor_is_type(X86_HYPER_VMWARE))
> +		return 0;
> +
> +	ret = kmsg_dump_register(&vmware_crash_report_dumper);
> +	if (!ret)
> +		return 0;
> +	if (IS_ENABLED(CONFIG_PRINTK)) {
> +		pr_err("failed to register crash report dumper: %d\n", ret);
> +		return 0;

This is weird. As I said, printk() is a NOP when CONFIG_PRINTK
is not defined. So, you would achieve the same with:

	ret = kmsg_dump_register(&vmware_crash_report_dumper);
	if (ret)
		pr_err("failed to register crash report dumper: %d\n", ret);
	return 0;

But wait, this means that the code below is never reached.

Ah, I see, you wanted to run the code below when CONFIG_PRINTK
was disabled. It was far from obvious. And I do not understand
the motivation much.

Anyway, it won't work because kmsg_dump_register() returns -EINVAL
when CONFIG_PRINTK is not defined. err != 0 ...

Let's take a step back.

Why do you want to use kmsg_dump infrastructure for notifying
host about the crash, please?

The kmsg_dump API should be used to dump the printk messages.
But this just notifies the host about the crash. It looks like
an API misuse.

> +	}
> +
> +	ret = atomic_notifier_chain_register(&panic_notifier_list,
> +					     &vmware_crash_report_nb);
> +	if (ret)
> +		pr_err("failed to register crash report notifier: %d\n", ret);
> +
> +	return 0;

IMHO, you either want to use the panic_notifier list.

Or you might even use the new panic_notifiers_platform_list
if you make sure that this is called as the last event
and you really want to stop the guest at this point.

My assumption is that the "host" will stop the "crashing guest"
when it gets notified about the crash.

> +}
> +late_initcall_sync(vmware_crash_report_init);
> +
>  #ifdef CONFIG_PARAVIRT
>  static struct cyc2ns_data vmware_cyc2ns __ro_after_init;
>  static bool vmw_sched_clock __initdata = true;

Best Regards,
Petr

PS: It looks to me like Sashiko AI completely failed here. It did not
    mind if the commit message made sense. It did not see the big
    picture. And it even missed that the code did not work with
    CONFIG_PRINTK undefined.
