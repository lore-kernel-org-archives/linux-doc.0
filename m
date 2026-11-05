Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873600;
	b=y4uDsg7SMd0GKe34xIz/8xuFnNgvPHojpAfDkw0LJaSKKk7uIzdUG1Dejwf3BcDFJWDl
	 GFuWWyrCG+z+fvqKa3w3AiKSznbJJ9EobQbo5kN23a+9Q8Q5bMYvTQzQU8x9XG7X5vCL+
	 DSv/xZcsvhcNG6HnycQGpw9zy9KGpgWde4/X8j/G4+s52dHCJU+7cuOiXnYP8U9lQQMhs
	 gS2r2o6GJMVtOTwyD62WRQvgPA15rOGCpVNZ6amGEZlvOW9aT8b7Ix81SyvY4jAfbAXJt
	 IYwL8dKYh9UR7ZVFIcmEFXAsMhGRb9AY51zyL3ZuQQiED9p3qk33jS/qeI2ob7PgZVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873600;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=HRfPjQi/EPajP85bp44Mrjs4W2fVG4O74jaEjdHYdtc=;
	b=vfa7tnDmoQh8tb6YIO2hzIgya+sUZLwDPV3lJUY7n8UYCCexGlT2uB0svLqIzJ4Nk1AC
	 qslP9ld/Sm53gLlTdNqb7Gd+FUfbf0DPQv71l7EkzwYqsUFjGQCTo45XDE3Qh0r5o75yJ
	 UwfrE1Jvxp71Ul6S7iP3rNMGAWLpGPMF4ZNMkbJo6a9Hu/Yjp9Gm1cKrtwL+vMJoTPPd/
	 3aJjvKJ4U76oHusniB448ocOt3Z8GT8QPkjayF1os1OxvT4V02TBoBNF/agm8mwh0WXIV
	 U16e40rffjuQ9effQy++jz/y6FlUxZW6NZJRfuUATDqQ3Mdi/XbBpWFRZb2HhDaVGww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179AF606EEA4
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 10:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 179AF606EEA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5430f70c827so17746261cf.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 02:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873599; x=1794478399;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HRfPjQi/EPajP85bp44Mrjs4W2fVG4O74jaEjdHYdtc=;
        b=NG9Fai02FLSkv8C5Uxb+Qldh/rOtjOmEZgIerMpc7fnmN4q5vJI/1K/5zu+Z5jrARl
         TIMe8rQcJaks47bVBV1M+jk5gi/9b+vT9LeAoHS5OjtUe9hjNa5yFZOWDZY7WpGnSC+/
         XfG3rNEzcSrdszcTqLXklsyFLqaqx5+uAcIAAjPsbRKlBckQ9E+i3XIA6bwYILw6/LCQ
         g5ct2Mg0qtiKTjnjhMJ6cCy8MlKPjgIhApxcrU+oFfI/rHZdA7+lNuSyP4vahyCADtb8
         tI2SghXDhX4wf7yW5SGyj7/C2dMqiaBmPQ6c7gbj4ktpoMnTiTRvcf8WY5AgOpo42rHI
         WqUA==
X-Forwarded-Encrypted: i=1; AKwUvBwzKSertZL7hidmdwpYeKPSHvXKZUwbQ5js9dMRZx5EhhuoSsRwx3XAml1TGm6igjvqHjFDDBnBcA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xzWFYmOK5QjM9GvbHXeTVsVklwLFO8IQj4x2giKvcBw5JDaVs
	+fSmT5t4rHIdkV9vtH4sjpYAYTWNoT8ZkjI2I9V0Pyh8zHtNujTMxPTfVpad6Y1fxYo=
X-Gm-Gg: AYBFou2OEq1O9iGX/nvjdeqD5y3h6M+kmTb+aR9FSM3BAyoBl65GLxA4/0i0Zu+ykEW
	T2RLGeuw7vRsR/gSU39xZzoHdGl8WMmP1FADb/z1JAkWLHAZ4g+Cjq9RAUUNQWcpdsLY/HdrlmY
	2XdUvD1jy2VRH/1toibPRdtpmGNfp+mmL0oerak3jDelRq+VrO6xFVOu10QtdYWT2H4ExHTkNCa
	oGFPNwaPKFJtWBPExyGPVF1RnVkkiG0e7cNoQDW/BJSF+g5+WAh0yJ4Ux7lJZC4sy/ql9HxWQaG
	jPSeSbKSPhpGGmJey5uBA9JNwLAjQ286613RIvK7+Asm3XUEm2UCAW5yBldinrPe1wbYVWtaZ+C
	eb6dz4uWBjq0U3xHqbPgG2u6+kJDuvg1gV+tk8Q9TBf3KfyLUMT1i5XxJ2xpsVVy+IKs7dzmzdW
	7cAgREQOxx5y/d7ZzrWuAHTfDnMIgYrOUKhUn7bjN7rJWsoVdRzawGEGX3Ahw+p2971h4kUI6z9
	bgjpJYkDfoApRw53O3FT1FZUJMmJQM8cSCLBK/XCVWxTZTBPBvllYycRzCO+Omy+gQjkQMW7fnv
	d6QqRP/WeVrAozIXYoUBkhy6fcmjJRVOFxW3F+cnuWojhVKKiVaeUOeacmexhe6PLeodCw==
X-Received: by 2002:a05:622a:34e:b0:535:2283:20a3 with SMTP id d75a77b69052e-542b7144d2fmr314699111cf.33.1793873598796;
        Thu, 05 Nov 2026 02:13:18 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b0d07599dsm47435951cf.2.2026.11.05.02.13.18
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:13:18 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e63ee7b4cso177791285a.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 02:13:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx+f3UKj9lpU4rfvUzJOgb/lsx64k9W/MPCCuRlvBFnCdr6ARx81HxF7YLv0Hpt2f6yTm84jSc+JoA=@vger.kernel.org
X-Received: by 2002:a05:6102:374c:b0:7cc:1a41:20e8 with SMTP id
 ada2fe7eead31-7d07227a940mr8060714137.5.1793873263361; Thu, 05 Nov 2026
 02:07:43 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org> <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
In-Reply-To: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 11:07:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
X-Gm-Features: AclHuK9naqg5CZQ7lhJVrMhg9TNH44f-SpA5WbUGCGBsAlcoOw2midTd7doJSmk
Message-ID: <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Wed, 4 Nov 2026 at 20:32, Christian Brauner <brauner@kernel.org> wrote:
> proc_reg_write() pins the entry and calls ->proc_write() which copies
> from userspace itself. A page fault in that copy can take as long as
> the writer wants, just like the copy to userspace of a read, and
> remove_proc_entry() waits for it.
>
> So do what kernfs does for writes as well. An entry that implements
> ->proc_write_buf() gets a NUL-terminated kernel copy of what was
> written. procfs makes that copy before it pins the entry. The copy is
> capped at ->proc_write_size bytes, or at PAGE_SIZE - 1 like
> proc_simple_write() if the entry doesn't care. Larger writes fail with
> -EINVAL. The proc_ops go away with the entry, so procfs remembers the
> limit in the entry when it is registered, like the size of the seq_file
> state, instead of pinning the entry just to look up a number.
>
> Entries that take binary data in pieces, like the PCI config space,
> ALSA's data entries or a firmware image, can ask for
> PROC_ENTRY_SHORT_WRITES instead. procfs then copies in the first
> ->proc_write_size bytes and the write comes up short.
>
> ->proc_write_buf() gets the position like ->proc_write() so entries
> that write at an offset keep working.
>
> Note that procfs copies in the whole write before the entry looks at any
> of it. So a write that is too large or whose buffer can't be read fails
> before the entry's own checks run, permission checks included, even
> where the entry only ever looked at the first few bytes.
>
> An entry that implements ->proc_write_buf() and still has a
> ->proc_write() fails to register.
>
> No users yet.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Thanks for your patch!

> --- a/include/linux/proc_fs.h
> +++ b/include/linux/proc_fs.h
> @@ -67,6 +74,16 @@ struct proc_ops {
>         const struct seq_operations *proc_seq_ops;
>         int     (*proc_show)(struct seq_file *, void *);
>         unsigned int proc_state_size;
> +       /*
> +        * procfs copies what is written into a kernel buffer and calls
> +        * ->proc_write_buf() with it. The buffer is NUL-terminated and holds
> +        * at most ->proc_write_size bytes, PAGE_SIZE - 1 if that's 0. Larger
> +        * writes fail with -EINVAL unless the entry asks for
> +        * PROC_ENTRY_SHORT_WRITES. The position is NULL for a stream, like
> +        * for ->write().
> +        */
> +       ssize_t (*proc_write_buf)(struct file *, char *, size_t, loff_t *);

"const char *"?

Seems like you have to drop several const attributes during the
conversion from "const char __user *buf" to "char *buf".

While at it, I think it would be good to use this conversion as an
opportunity to replace "char *" by "void *", which will probably let
you drop several casts from users.

> +       unsigned int proc_write_size;
>  } __randomize_layout;
>
>  /* definitions for hide_pid field */
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
