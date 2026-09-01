Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871853CF95E
	for <linux-doc@vger.kernel.org>; Tue,  1 Sep 2026 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273567; cv=pass; b=gUL+pmEzTsklioVfEs6BBGoPWvNY8CvN7A7EzD4CXZdD+nZxVEH34pa2tFpkp7U4MClhIon2R0Mxg3SyPI5icCoRYpE7X1mpozy4xgGEBg2SYjIVCyenmWRv+m69vBh0FqfGaGd/hvDKyViTNSN3fYj/tGXNcdaXit7El6JW6+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273567; c=relaxed/simple;
	bh=ezB1u13ZiW2aWn0+EIDTWrRL1Wtrd/zkMqdzWSmMzUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uRFj6JrmYizOKlyMhKJ+QhRhne1Q61ELMp7Y30+xiAZbAqlz0hfONGTivZencdc5mqPiSoLSZy6lvdocrPFV4WhCGH9EtT4PJbGck3cFTKnZJGBgecokG56COS2yYTG/1mgMx8jpX9a+f+BzxoqJy/aShhkPaiY83uQKI9k5LfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XJtt3x2i; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XJtt3x2i"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a305310ddaso39302391fa.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Sep 2026 07:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273563; cv=none;
        d=google.com; s=arc-20260327;
        b=H/zMOi95YqGx8uycTWE2OllwwAIc+kFnkYgc9iq+Gp6S3OfOYcLfCnio7hiK2zWP9P
         YyB/YDofpqccoFAf0xytz3PDcmUF6s8gAGXszF93ti+gOU9zaDucYgyFnjzFwgtG1Nrt
         /o17w42sSeCvVM6nP7MwJI1ZghGGIndp6F1vY1td+HMn6v+WJrmeMqVybcZh1dY7wUB1
         8fsgpg2XQ62T9Odv2lyKWYpNn5o+YkqpsLHfv43Y/6IxpEcaBhPLt0zXythP5s2LWSY0
         RSJuWV8mF19dn6mhydiUNAL4AClZBtjt//rBIhi8qUMFDIumzw7xPCpM+qRIvq+5IRMJ
         UXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4zXL6SZO7LbfgCv91B19FUnmIBBFOrbIlFHnTQGchwQ=;
        fh=yWr9kOgTb2aI1nlngjBVgeKHA9/ukHHgNHcKD1uvDnE=;
        b=LGKI5XhxyprhzwHmfb4zFQ2lhXRNay6n+i82qNJu6dlomqMhUe7Y+DrWd4f0fQMOZ/
         85rik7vJqd2iMhCM3Gw82mD8YVOmYdoY8fQKJLbVn0NVu+wnkeYfUuJO2mWfNedXclpg
         mFE0UIRPhaM0jmY0Os0U6ctoSfIksInrPPqtzcQjBWiiWOuuDLJ8aGeg5O+8TKUfNaUA
         NNl0mvVW/yfFILW+caU1SE+P9uUVC08gOBFkB5oCK39tvi5eCsf0gQ9XfqXa5lik9z0R
         04uiaNXyNUAC2CssFz0TlwcpeeH7ycsbNKUF+mH2O3NW24qx9/KPDZgFTtOaQme6zLtx
         6PzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788273563; x=1788878363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zXL6SZO7LbfgCv91B19FUnmIBBFOrbIlFHnTQGchwQ=;
        b=XJtt3x2iPSreqz/DeEMb3BZTiUTaSlYYV8BR7ylWi6OItGGYLVexHvdAKFsIGbj+ms
         xRYZhgxhEtu8PuKR8cWElI1IBlXWLMdo3baBjJaTQSQ4KicTLCO4/A8vR3btW4cWH+ks
         vQ1YKEcI+NjrPDxcdeedPTqizQEqDxabnhnmT/6BibD99ULm0uqMtEubLWkqBDEgRut4
         XRvKjiDqQKKjxLXTG7f07GFkrYqn1taWY00kGq12aZmQPN0Z3OGFezAbx5hENMajNXVw
         HDEATuekEhdHMoetDpaRRoJcP9e13gAsI81cWgu1HgyF5iS8nhZHcU4vNhNlyuFWDLbt
         RzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273563; x=1788878363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zXL6SZO7LbfgCv91B19FUnmIBBFOrbIlFHnTQGchwQ=;
        b=MPTcvyYMIT6+cI9DcJ2WokrPQ+tHw2LMPmWUiFxnqMI0ud9eWIZuLuxOEm6T8sGmyR
         nNzUl5R/eWFTqmrwjUwhL2Xe8Sls+J64ElNa4OXWEYvKgwPqA0zVhh1wNAk6qUwRtevp
         CC6qMWySTb0Eiqe/+WV0m+QxM8kjzBjS5vp03Kp6UiwULrRIvStdBFvB+w58sDF6qmcd
         98yxtpoV7Mdut2HTMhY3rKR63j1IPZeLiTDmNr2skr4CXqUBDyGrmWofHYg3TfV92GaW
         CNzQ567fra+r2iBA6EdLQv3yiLrsHjZCS7jst+867oFulGA0n94+Dm9Hp+JRVPKhtu5q
         3Uyg==
X-Forwarded-Encrypted: i=1; AKwUvBzplZKt/lmRirw/67fhkphzXVvyteiwtZU+RP62y9qWtf9M/lfPJE8Zj44aFdEVkns0iydEzbRz5nc=@vger.kernel.org
X-Gm-Message-State: AFuF++nf5c/AzSOs5CZP0M3EYqqT6gBgaqvpoWCTPyl4DY1CHTF4Uk+c
	lED2z4O3HhBzApxg+49bEOerBjSWFsqwc06MVu2B29D5HrdzCXCm/mfao/nnyiqIuWQ2UWiGFmM
	UjM9WZAtrEEpvcFU+60NfDBO4p0IiWNo4hqIT7H4Qbw==
X-Gm-Gg: AYBFou0qv6cvENhxlQvxHF8mdgsl8m3aQ4IYRBQjNZ9qPL/ntnUsUZwkPWaIqVsiJdE
	I/yl60INZnv69O+sZ8obct8n7FrR0pUXymneYjdk/sRB9s9tLdyMrauy2lm+uPn0Kwm6zqaFjQl
	NJuRlwAC8E1vNm4bcUKByYDbxHnmH3tNdClM7KuADvVQPTVSCsX6UUUBO11DEPJSW2ZtZ5tvUmN
	e6eYmTG/szd9GFsZS+6KnwKFi0SlMM1I6N0cELi+LcC+yKValrm06CqjeL+vbxXjFtGFS+3FNa2
	oFcAS2uGp0jP3Xivamf0PDY5vI4KmdyP4D4J6pVmLq8ouU/Uawvt0aNyafO5FlvSZLLOBTGcglB
	s0Q==
X-Received: by 2002:a05:651c:a0a:b0:3a3:405f:9668 with SMTP id
 38308e7fff4ca-3a3405f992cmr12000371fa.8.1788273562981; Tue, 01 Sep 2026
 07:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831092118.124576-1-marco.crivellari@suse.com>
 <20260831092118.124576-2-marco.crivellari@suse.com> <20260831110721.2o3u-edi@linutronix.de>
In-Reply-To: <20260831110721.2o3u-edi@linutronix.de>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 1 Sep 2026 16:39:11 +0200
X-Gm-Features: AcwNN1XdNVMYFOSZMjCDjBBbWQv689CK9XwNG1dJn9Z6nd_mz_4j8iFMayB1rmg
Message-ID: <CAAofZF4+es1uS=9wOEnrXZ54qhR9C6aHZxwXGLS65ZTzy3=00Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] doc: Replace dunticks-testing ocurrences with cpunoise
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 1:07=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>  [...]
> > -- dynticks-testing does something similar to rtla-osnoise but in users=
pace. It is available
> > -  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-t=
esting.git
> > +- cpunoise does something similar to rtla-osnoise but in userspace. It=
 is available
> > +  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.g=
it
>
> We usually do https:// here ;)
>
> Sebastian

I will fix it, thanks! :-)

--

Marco Crivellari

SUSE Labs
