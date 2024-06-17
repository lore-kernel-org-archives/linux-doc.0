Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52C418F2EF
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 23:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718666240; cv=none; b=RDC1hQ14MwLUpM8wSRDVmPNjRoZ8vfbw358zvHU0aYakFIKhf52R7qDBTApIR5p4FyB7ooMXTlBPWaAHqGp5U+IXg60WU179/e9tuDNwAEMqAqfdooqanv/kNdbwSGawgb7yOp0k1wvrvb7w0NeTUSMgVPD77nbYeqGdo9j4jT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718666240; c=relaxed/simple;
	bh=TIVKLKBbPeyPY3DUp3NhHPp0olJ3tYleN+y+FMgAMUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MP2b3DPHjH7c0p0n0N+0RmTku+K5244oGpuFgVhZVSLuJV27+bzVbM9SsS1YpBS9XyB1AwYMdZyssvblPyz8niQbmVPfqTdx/ReA5XqmTmHShJXjnyo4NdjhsczbGblfmnu1eZvyUs7mrkaawCXd/OxUsaZZZ2Sm++1T4A8/fyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZWzVSWK6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZWzVSWK6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-35f275c7286so4397385f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 16:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718666237; x=1719271037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y26m8KMuV8p2bUSqQESXrG+REwA97eviu6gSbQ4tKIc=;
        b=ZWzVSWK6nd4VBy9m5OLrLwqGaSeKyfvtFmgtzoqwCwgkiujJme7qfP2el7BZDrFyut
         UttUaqsOB8ZIQEwJ2Ku0By4E35DLp1/zUpG6zjdlT2PPp74bJWCJn9a5mGzDV5hhl86X
         Pgwdo19QpaZi5SeQLn6aiZvbRDeXHQFXFoUhG1BMqy+iHhXp9fg6vUbjcPk5kt3Sc3d0
         UqD0Xu0IDrg0p5YankOS88AnTbbxnblTDZqE4sumKShOHx9sZGOSMyIHrepcu/CCcAoE
         Ig0lG4687sUx1opUutvqSOAcqyhctgVKRKlTp45PXD00pdOYjeK8IPdezKbRAH7KeaPd
         U1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718666237; x=1719271037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y26m8KMuV8p2bUSqQESXrG+REwA97eviu6gSbQ4tKIc=;
        b=hzRT5eNf/0AL6RNtl9Fhai9qc1VHYtTAu9+nCzNSGcQrlS25vV3LABAzCJwMisEuMd
         1PV37U7P0Ktul33d48u+PzqY8mInMqbP/4FVXFJx4JbJ6WV/BdsbcZHiyzdIAGOZ6bOT
         OnaHGrPz+HMSih1fb9dT3IMPwFx7QtruRrxch4cUHG0/lVEPKdFNIBNQaOF3F1lqflb4
         bWGJsjmpP1/UIgcctpb+1olfujNnc9SgA6yTStusoLmNMXoq4RXmbyMdXg63xCo3W/Qx
         cvGEMr1NvhOs1koBvF5XjcH6lE5irw7D5dzIp5qz5tReysnZm1WvK2hqALuM1eBqKM8u
         CApg==
X-Forwarded-Encrypted: i=1; AJvYcCXsSarDkCrwCrXuljFhhltULMlaRS7cnDSIHp7RefVI3C3QTkW6tlN+vA5tq/JeUGyCbfhnSoS1oSS+MnVi6Et/g1MX5xv8ITUW
X-Gm-Message-State: AOJu0YwGV64yL/j8QlCwRH4sPAJAcZypUoozImAAWx6Ikuil/HEUrqJ+
	fZj5SdYFXzpxvjt1zAZ5CHZv9ngVBYSN1p5bTS2d6pm/nVeJYI8MMYAXjEjSAfhL+zOZdC4TP/K
	enAVorCTyw4ql1UJXo/UxraMcRk40qVYDlDM9
X-Google-Smtp-Source: AGHT+IF4HzjtSiEJm/JF7RZmDBSylbGJKMvF570CPPPNOrU07F5yzEv/z3JKNLnewEVpPcf1lCjwtP+ww+rMlM3/Cw4=
X-Received: by 2002:a5d:468a:0:b0:360:709c:5040 with SMTP id
 ffacd0b85a97d-3607a736520mr8281019f8f.2.1718666236739; Mon, 17 Jun 2024
 16:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617170545.3820912-1-jiaqiyan@google.com> <20240617170545.3820912-2-jiaqiyan@google.com>
 <20240617121348.4ee672a1d6bc9202b3ad0e08@linux-foundation.org>
In-Reply-To: <20240617121348.4ee672a1d6bc9202b3ad0e08@linux-foundation.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Mon, 17 Jun 2024 16:17:01 -0700
Message-ID: <CACw3F51wq4H-Hoxvm7GgCKodAR4Wy28hwBD=VngcF-fbxyRmUg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] mm/memory-failure: userspace controls
 soft-offlining pages
To: Andrew Morton <akpm@linux-foundation.org>, linmiaohe@huawei.com
Cc: nao.horiguchi@gmail.com, jane.chu@oracle.com, ioworker0@gmail.com, 
	muchun.song@linux.dev, shuah@kernel.org, corbet@lwn.net, osalvador@suse.de, 
	rientjes@google.com, duenwen@google.com, fvdl@google.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 12:13=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Mon, 17 Jun 2024 17:05:43 +0000 Jiaqi Yan <jiaqiyan@google.com> wrote:
>
> > Correctable memory errors are very common on servers with large
> > amount of memory, and are corrected by ECC. Soft offline is kernel's
> > additional recovery handling for memory pages having (excessive)
> > corrected memory errors. Impacted page is migrated to a healthy page
> > if it is in-use; the original page is discarded for any future use.
> >
> > The actual policy on whether (and when) to soft offline should be
> > maintained by userspace, especially in case of an 1G HugeTLB page.
> > Soft-offline dissolves the HugeTLB page, either in-use or free, into
> > chunks of 4K pages, reducing HugeTLB pool capacity by 1 hugepage.
> > If userspace has not acknowledged such behavior, it may be surprised
> > when later failed to mmap hugepages due to lack of hugepages.
> > In case of a transparent hugepage, it will be split into 4K pages
> > as well; userspace will stop enjoying the transparent performance.
> >
> > In addition, discarding the entire 1G HugeTLB page only because of
> > corrected memory errors sounds very costly and kernel better not
> > doing under the hood. But today there are at least 2 such cases
> > doing so:
> > 1. GHES driver sees both GHES_SEV_CORRECTED and
> >    CPER_SEC_ERROR_THRESHOLD_EXCEEDED after parsing CPER.
> > 2. RAS Correctable Errors Collector counts correctable errors per
> >    PFN and when the counter for a PFN reaches threshold
> > In both cases, userspace has no control of the soft offline performed
> > by kernel's memory failure recovery.
> >
> > This commit gives userspace the control of softofflining any page:
> > kernel only soft offlines raw page / transparent hugepage / HugeTLB
> > hugepage if userspace has agreed to. The interface to userspace is a
> > new sysctl at /proc/sys/vm/enable_soft_offline. By default its value
> > is set to 1 to preserve existing behavior in kernel. When set to 0,
> > soft-offline (e.g. MADV_SOFT_OFFLINE) will fail with EOPNOTSUPP.
> >
>
> Seems reasonable.  A very simple patch.

Thanks for taking a look, Andrew!

>
> Is there sufficient instrumentation in place for userspace to be able
> to know that these errors are occurring?  To be able to generally
> monitor the machine's health?

For corrected memory errors, in general they are available in kernel
logs. On X86 Machine Check handling will log unparsed MCs (one needs
to read mci_status to know what exactly the error is). On ARM, GHES
logs parsed CPER (already containing error type and error severity).
The shortcoming is logs are rate limited. So in a burst of corrected
memory errors the user may not be able to figure out exactly how many
there were.

For uncorrectable memory errors, num_poisoned_pages is a reliable counter.

>
> > @@ -2783,6 +2795,12 @@ int soft_offline_page(unsigned long pfn, int fla=
gs)
> >               return -EIO;
> >       }
> >
> > +     if (!sysctl_enable_soft_offline) {
> > +             pr_info("%#lx: OS-wide disabled\n", pfn);
>
> This doesn't seem a very good message.  There's no indication that it
> comes from the memory failure code at all.  If the sysadmin sees this
> come out in the kernels logs, he/she will have to grep the kernel
> sources just to figure out where the message came from.  Perhaps we can
> be more helpful here..

For sure. I took it for granted that any pr_info will have the "Memory
failure: " prefix, but now realize there is a `#undef pr_fmt` +
`#define pr_fmt(fmt) "" fmt` just above unpoison_memory.

I propose to do `#define pr_fmt(fmt) "Soft offline: " fmt` above
mf_isolate_folio, so that any soft-offline related code generates logs
with the same following format:

  "Soft offline: 0x${pfn}: ${detailed_message}"

If everyone thinks this is reasonable, in v4 I can insert a new commit
to make the log formats unified.

>
> > +             put_ref_page(pfn, flags);
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> >       mutex_lock(&mf_mutex);
> >
>
>
