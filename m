Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574392;
	b=JR1oz6x4lBUw6bQsYpnXA7Q7YnVbzJlnhYHXzlNLv5pSk75jYWD84UH6tCIMdoSIYxaQ
	 SMSWV7BAjF063l41W3NefRdeST/XTox2zXjWgmZlrjH05ALBvBX6agJMMWMQ8m55a+MrK
	 44lEjugde+8BiOW0NMLI5frozJ0LV/sYMPx5vXiy+hbt2/rQbER6bzbtKZYGHniOifjKQ
	 WSmk0HiofDI9Km1iS01Y+aaRMgDF/on9Zjzw/hPluGsnGM3L+8WPKoSH809NrJBLPrKJl
	 PFvDlN3qZvt4ryKeh0UFI4buZd/y2qsgMpx3vSJZgiR2uilMmzm6IGU8ZOGQfy4B7UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6/75JVjkGfUZNuP8NFIFjHczXUWWhov5nZZde6RyI+M=;
	b=cXNw7QZqHoz3XAGyt+8c55qftrl++9X35gO7nWd2ou5Gwmrir8ZObvXJMJuIox3nfdvR
	 Ps2UMShf4OqrsPdprR0sUQ6rQzeM6JXo5UJ2Oi0K35RSeJcJs/cTDDoFN/RlRszqzUfDD
	 1Z/VKDAalo17OVeG19KvXrvvyn1RAc2U0Qkp0e6VdUphn9ZwH77wf9kEf7u/CqB7ziLMA
	 sDe4L68lKoCjexJsfq2Ss8oBK+seHiZl4KyGJjbUjU66trbDcpiFC2pr3wN4R2XfXMBew
	 VX303sf37iOO/V4+GaDKgrMJfuJivejHEotEDrVz4glf0p/D6OXjiB59SBPU8gHSS5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V0N1Ub85;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756E2606A31A
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 09:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 756E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V0N1Ub85
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e011d370dso361548f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 02:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792574390; x=1793179190; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/75JVjkGfUZNuP8NFIFjHczXUWWhov5nZZde6RyI+M=;
        b=V0N1Ub85qdlLkYutsb7tpcJl1kxj7si4BVpJ3pp7/kqPoDkCDY7jkYStBPKlnWGVkp
         4Yi6boIZD5WkNa0u8ovBIz1d4IGXZ9a5fi0v38U+U4CjcCDWQO5xkHrszi8dixzsdyoP
         zIEE+RacsYn/cBfjmYmXCz6OJFf/WZRYsyIoItH9CKR25CuxClHL3HtBmi9rw967UI0C
         WLkamH6uuio2FWc0DykZY2AJo70UlZO5FFQAPBpHB8b+YdNUpR9on8GFiiv6esS0tj0N
         /Gwiy1J8tRZnuHSnWOFtjTIS0NRUEPTiLjPsksvwQmbrazCNF37FOfgLgq4JYBT3vlW/
         JeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574390; x=1793179190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6/75JVjkGfUZNuP8NFIFjHczXUWWhov5nZZde6RyI+M=;
        b=mX+kPJ5nEs9SrWxZfwrBLeFna5R1rWg6v/53/dnJD7cNVFbXfznNXS3oTpeBPjbDNK
         nIuZUeuAuxlTFYNbGMVh6f9enucevoI9IhDZokfGyZWz8+cSbzU65ijgQfI6ehUSNbnU
         gWZMG9zLTJM6IirOndeg/FJpIxbcSWYfs423uE10QFYK6VTiNtbcoYIDdXW6RgeV43sU
         4ytuKSs7l8Um+gqfMWBmh0rLQUZpKsxDp+5l+XIFzVGEpu/TL8Yg6ai0xVfdeNGtzeto
         XxxbkMT8ibPDcKcxTsd53DnaW2a+Wm2RI+2DwHcWFNXJofsgpRwORRlx9FnUa6mpy9dd
         3IFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVQ9+3OzDLv5ADMdNI7l23gwyDB2RyG8hL4YWAXIZCQwAyj5G3K39inkbZ5JZfdd8nlQzbjBrQRZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkaxR3Up7w+3xXeD60X9Mbq8qE/1VXAdNn7mpN3dT7TmuPp3/c
	+uC+uU5v0DUwEdhd74y8ZY8PHJlhoLKXc3TGenD/Kyr611K2WEHXVORgcsY+FuRUZ+Y=
X-Gm-Gg: AYBFou3t85cz9kRHS7d+1Lv8hM29cnv7J5wMXXJG98JUrjcSzzXzRWeHCQO9McJ1NKT
	RMnvh08XfGRGzHfwAOqHxm49vcpq3tykyP4pcCWBAXzZGfXLrU5nM8Yh23VcsTGkb+xFvCgUY43
	T2WPgRzpn7/QRSoZw3+YQydAEGbebsNsuANONdG8bEWwWBoH4Pub/MogxQWXAUVuufBW27XWw7Q
	am6T1hKgNbPgu0ojLTK2nHYV+kdfE85dOsvUn1nQfsf8OqbhPYeRVH1SPqY9F9RNrISHh5a2Fyb
	K1BSr2rSZYgAtyLl0zfmVDJa0xh4GZ41ZLjQz74IYWhDqMAnQwrWlpFSv9E7LzzblbUrevy1yBW
	R/JTaUUhTRjXB5+3u6dS0PAw8LhO4VPDw62nyHlDQZtxh1yx48/DPlBYz/JBLjJ8MK/GRuizOIW
	pZaIR6I7Qb9Tw3IRvAFxO9AGhWnde17R15qhuKZLRnXHK5TlW5h3vqzvpld23EvAg4WV1xqG8yo
	upi2cMfVBROuev2lwgEXdky5LstARyFjxoVFfiKZEr+5oXRSOMhvuWor8I6hW0kDaa7PAZ6
X-Received: by 2002:a05:6000:4805:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-48e2647cbedmr2527057f8f.18.1792574389649;
        Wed, 21 Oct 2026 02:19:49 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25834086sm4358154f8f.34.2026.10.21.02.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:19:48 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:19:46 +0200
From: Petr Mladek <pmladek@suse.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Baoquan He <baoquan.he@linux.dev>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	Dave Young <ruirui.yang@linux.dev>,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Pratyush Yadav <pratyush@kernel.org>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: Re: [PATCH v2 1/6] panic: Add a notifier chain for pre-kdump
 callbacks
Message-ID: <atiDsmnUM7v2UJkY@pathway.suse.cz>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
 <81cb85568b36273a8e66215b3e6d671b8488d402.1790014793.git.zack.rusin@broadcom.com>
 <bc783856-9480-3944-67fb-675e4c11d8c2@igalia.com>
 <atdYIxwz8ksYNty6@pathway.suse.cz>
 <atd7GInNurGWLUha@pathway.suse.cz>
 <ateYxCu63pRY9EGq@pathway.suse.cz>
 <CABQX2QOKCpoUY_ObhFif7xN7OF-NzcxEM0JABAXo9n9KaacO7A@mail.gmail.com>
 <atgdwrSbsZD5iWsX@fedora>
 <CABQX2QO6fwvKZwG34uOYDU_ae4M4_n2SMsYmqoLgOPnWkao02w@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABQX2QO6fwvKZwG34uOYDU_ae4M4_n2SMsYmqoLgOPnWkao02w@mail.gmail.com>

On Wed 2026-10-21 01:10:25, Zack Rusin wrote:
> On Tue, Oct 20, 2026 at 10:04 PM Baoquan He <baoquan.he@linux.dev> wrote:
> >
> > On 10/20/26 at 03:23pm, Zack Rusin wrote:
> > > Hi, Petr.
> > >
> > > First of all I really appreciate you going over this. Thanks!
> > >
> > > On Tue, Oct 20, 2026 at 12:37 PM Petr Mladek <pmladek@suse.com> wrote:
> > > > Approach B: Three lists: platform, smp_safe, and smp_unsafe()
> > > > =============================================================
> > > >
> > > > It is similar to approach A. We would just add an extra:
> > > >
> > > >      + panic_notifiers_platform_list
> > > >      + disable_panic_notifiers_platform_list
> > > >
> > > > This list would be used for smp-safe notifiers which are
> > > > required be some platform. It would be the notifiers which
> > > > are crucial. Which are currently the reason to set
> > > > "_crash_kexec_post_notifiers".
> > > >
> > > > It might be called also when __crash_kexec() is called
> > > > outside panic().
> > > [...]
> > > > This patchset, adding vmware_log_notifier, might implement just
> > > > the panic_notifiers_platform_list. The rest might be
> > > > added by another volunteer.
> > > >
> > > > How does this sounds, please?
> > >
> > > That sounds good to me. For v3 I'd do just the platform list:
> > >
> > > - One call in vpanic(), right after kgdb_panic() and before the first
> > > __crash_kexec(), whatever crash_kexec_post_notifiers is set to. The
> > > list runs before kdump and before the other CPUs are stopped.
> > > - One call in __crash_kexec(), after it has taken the kexec lock,
> > > found a crash image and saved the registers, for paths that enter
> > > kdump without panic(), like oops_end() or Hyper-V's hv_crash_handle().
> > > Once the early panic call has run the list, the guard makes this one a
> > > no-op. That removes the dependence on crash_kexec_post_notifiers you
> > > pointed out before.
> > > - A once-only guard shared by both, so the list also runs only once
> > > when a callback panics.

Just to be sure. I think that a simple static bool or int should be
enough. The caller is responsible for the synchronization. I believe
that it should be done by the "panic_cpu".

> > > - disable_panic_notifiers_platform_list as a boot and runtime switch,
> > > checked in the same helper, replacing panic_pre_kdump_postpone.
> > > - Kernel-doc with your definition: smp-safe callbacks a platform
> > > needs, which would otherwise be a reason to set
> > > crash_kexec_post_notifiers.
> > >
> > > Roughly:
> > >         kgdb_panic(buf);
> > >
> > >         panic_notify_platform();
> > >
> > >         if (!_crash_kexec_post_notifiers)
> > >                 __crash_kexec(NULL);
> > >
> > > and in __crash_kexec():
> > >
> > >         crash_setup_regs(&fixed_regs, regs);
> > >         /* Direct entry outside panic() */
> > >         panic_notify_platform();
> > >         crash_save_vmcoreinfo();
> > >
> > > I'd keep the second call in __crash_kexec() rather than crash_kexec(),
> > > because afaict crash_kexec() can return without a crash image, e.g.
> > > from the BPF kfunc, or from oops_end() before it panics. Calling the
> > > list there would use up the guard even when no kdump follows.
> > >
> > > crash_kexec_post_notifiers, the existing list and the kmsg dumpers
> > > stay as they are, and moving other platforms over can come later.
> > >
> > > The VMware log copy would be the only user, and it's still best-effort
> > > diagnostics: kdump and the reboot don't depend on it. It copies the
> > > log tail into an 8 KiB buffer. On panic() that happens after the panic
> > > message and any local backtrace; on direct entry from an oops, after
> > > the exception output. With the list enabled throughout, the copy
> > > precedes the later panic notifiers, sys_info() and the all-CPU
> > > backtrace step. The guest-crash report stays a late kmsg dumper that's
> > > skipped while a crash kernel is loaded, because the host can power off
> > > the VM inside that call.
> > >
> > > If that matches what you had in mind, I'll do it that way in v3.
> > >
> > > Guilherme, Stephen, Baoquan, does that work for you too?
> >
> > Hi Zack,
> >
> > Sorry I didn't check this series before, just trying to catch up.
> >
> > I like the Approach B direction: one panic_notifiers_platform_list for
> > platform callbacks that must run before kdump. While I have one concern
> > about the long term.
> >
> > Today the list has only the VMware log sender. Later, more handlers may join
> > (for example pvpanic, Hyper-V, Xen, gsmi, SNP). When the list grows, someone
> > will want to run only their handler, or to skip some handlers. The easy
> > answer is "add a new list for my handler". I think this will be a problem too
> > in the future. Every new list adds a new global ordering rule and a new disable
> > switch. Petr already said we should keep the number of lists small.

My hope is most of the potential users won't be registered at the same
time or will be a NOP in the real life. Because each particular system
will actively used only some technology.

But maybe I am naive and there will be selection and ordering problems.

> > Currently, atomic_notifier_call_chain() runs all registered callbacks. There
> > is no per-handler enable/disable and no filter. NOTIFY_STOP_MASK can stop the
> > chain, but we must not use it here, because one handler could hide all the
> > later handlers. The list-level disable_panic_notifiers_platform_list can
> > only disable the whole list.
> >
> > I have some rough though, just for reference:
> >
> > 1. Keep one panic_notifiers_platform_list.
> >
> > 2. Give each handler a small wrapper with a name and an enabled flag:
> >
> >    struct panic_pre_kdump_notifier {
> >            struct notifier_block nb;
> >            const char *name;
> >            bool enabled;
> >    };

This looks good to me.

> > 3. In the dispatch, skip a handler when enabled is false. Print the name
> >    before calling it. This also helps when a handler hangs and we want to
> >    know which one it was.
> >
> > 4. Add a boot parameter to disable handlers by name, for example:
> >
> >            panic_pre_kdump.disable=vmware_log,hyperv_crash

I like this. I think that we just would want to do s/_pre_dump/_notifiers_platform/.

> >    Parse it early. At panic time we only read the flag. We do not parse
> >    strings in the panic path.
> >
> > 5. Keep the list-level disable_panic_notifiers_platform_list. It is still
> >    useful to disable the whole list for debugging.
> >
> > 6. If the list is still too broad later, we can add a reason/class argument
> >    (for example PANIC, OOPS_DIRECT). A handler can then decide if it cares.
> >    This is better than adding a new list.
> 
> Thanks for looking at it. I agree we shouldn't add a separate list for
> each handler, and named handlers with their own switch on the one list
> sound like the right way to grow it.
> 
> For v3 I'd like to keep the series to the list itself. With VMware as
> the only callback, the list-wide boot switch already lets us disable
> platform logging. The sender also has its own sysctl,
> kernel.vmware_record_panic_msg. We can add per-handler selection with
> the next user, when there's an actual choice between handlers. I'm
> happy to help with that when it comes up.

Sound good to me. I would like to start simple. We could add the selection
later when it is needed in the real life.

> Two of your points do fit in v3 as documentation. I'll change the
> panic_notify_platform() kernel-doc to also say that:
> - callbacks must return NOTIFY_DONE, because NOTIFY_STOP would skip
> the callbacks after them
> - the notifier value is 0.

Great catch!

> The VMware callback ignores that value, which leaves room to add
> reason information later.
> 
> Petr, does keeping v3 to that sound right to you?

Sounds good to me. But you might want to wait few more days for
more potential feedback.

Best Regards,
Petr
