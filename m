Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF0B133987
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 01:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738891743; cv=none; b=W4OWoAlxy9/ajly16pGk37nuLo/sz30Slw6tXuC4hOLqVKFVUNDE27akNxsUb68vE8YKkKWZrjnHSA5zznOYvIpxr+t15EH1OF2diVNN3tKtyn1zQqLxzv6LJj718wWZP+zJHcnL6scNx30Vyib+k06V5xP6Oq2Y3Fzo0YLzsrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738891743; c=relaxed/simple;
	bh=eFJX4s4D89MGtn2vvvBPckM/BVnh3lF4ZgDrmAI+YLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4ySHd3Xg/+jikiBO4Yt60EQzbosXfIx2GPeGWnJ58QyqxGyTszPVdMDB+SQ66JlbKrN/HYgOHn/FynaiaHDQzrQkdD3eYP6LgXDTuau/7qWWQdEASrOy7EZmcuUf9vcDKtyzh1lY6F/VqwZyBb2J4OJiCgglISSy1fFOtAAqxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=R9P58BEs; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="R9P58BEs"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-46fcbb96ba9so18402461cf.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 17:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1738891739; x=1739496539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/B6rKXoRP9BkkuR2mn1tTK5oITIELKG2LYs8WqA/Z0=;
        b=R9P58BEsug7wDF8FGn4PfOpstoVAam00NOL8xLdtlsznu8kWYR6WrxY6mF3E19m9zf
         7I0g8M3RfglvciDp04mvJ37mf5X9+5NDy8WUN1S7u8Gf4GyxTPEf+q2V17HBjPoxSjMi
         aVvhwqYPtG8JiORyN1qKtJcb5p9HLXA7wn1Rnmqtx+YduifZ86AAKCSprKji8ql0YUF+
         Y8ybbTqfoyRzJXkwlc1wTG+UZX9ykj1khK6CAFR5I+rawKi+thVFKk5TPgZOJRpZmhmy
         e9lsR+dY8j0hCXADTumAYxHo8UQBkNgGzMBN59pU85wwAoIRuKgzgEOyeFHXXVsknEfI
         o5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738891739; x=1739496539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/B6rKXoRP9BkkuR2mn1tTK5oITIELKG2LYs8WqA/Z0=;
        b=ThUAxAOLg0weeEXAtKo7vtGQBAeYX4jaGTZEgV0K72fe4Z46CpbR8LdrbUhkArwQ17
         LMABOkkkCP7IFts/uQC4SZwEz3vepZlJSJxt55DSFOTTK9HAJz2jTGTxTOszqcbhLrUH
         ++e3iflQCn/qeHk5GzGv+fBcgcjQlx1ZwBPkC5m1jafhoVNKIYxQ2SzD94/9LXOKmHkC
         dr3IPVi2ZRFQXphuw8Xb0CRIdN6ANed4WBpYW99ZGSZNmrgjTNNB/vjog+XlDnot1szV
         don7x2zZdpst1NiC833dPxk45n+Ym9Gxr/In+s0ghLipsMTwH4vtDrfCCSGVpsGazBDi
         hJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWg1v25MrIeLmT8ePCYF7Ez6Qo0p/YwQ7vDX0HAn7pxuFgh+cDTHkZ6knbC9W0+W48pxfsZzJjk1CQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLDGWG53bxqK7fjYydkeggtbnd/QfP0RxhZBdRGQf3RrF9YHEk
	NHsJWAUV1OyJkYsgJk+DLtHeQ8IlBgUJUlOUAweXuLUwYq+YZepTcsuPBvquqO94ivI+T9Q/LYP
	OTbT6gtxaMpc4eiWN4BrlrzVk8LKUu9/Nr81Q/Q==
X-Gm-Gg: ASbGncugXX1sEBE6HdAAEuFvdMmgRebJBSX1XFTUHtYAwbIrRxq57RbIX2RpcLqoGcY
	9OC51L62OSJpDEjzXk3Y9iPkQewKahlyMT3S2qSLPTG/C/YIRCLITxB8v3uaJAFA3jidFmg==
X-Google-Smtp-Source: AGHT+IG/qU+DQGRbIVpasPJX4dEgRbGI1bwsgyRQgH7sLyexv6ztYzz7dd87jk6gdrjtGjTpHMmepc+RecJuVSIbOWM=
X-Received: by 2002:a05:622a:30f:b0:46e:24b1:dcd1 with SMTP id
 d75a77b69052e-47167ae2a56mr22008491cf.32.1738891738868; Thu, 06 Feb 2025
 17:28:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <20250206162939.a1f86fb835f1eeb7ed73ff1c@linux-foundation.org>
In-Reply-To: <20250206162939.a1f86fb835f1eeb7ed73ff1c@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 6 Feb 2025 20:28:21 -0500
X-Gm-Features: AWEUYZl6iTKJpq_CKya0Z3uq2I-kaX8PhW2bxqIFxSemVzQfHVc82dvbk7pP-8Y
Message-ID: <CA+CK2bD6204AKWGOgzLMiMsnVZ=tk+DGc+VWgi3RVt2byaLJJA@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Alexander Graf <graf@amazon.com>, Andy Lutomirski <luto@kernel.org>, 
	Anthony Yznaga <anthony.yznaga@oracle.com>, Arnd Bergmann <arnd@arndb.de>, 
	Ashish Kalra <ashish.kalra@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, 
	Eric Biederman <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>, 
	James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org, 
	changyuanl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 7:29=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Thu,  6 Feb 2025 15:27:40 +0200 Mike Rapoport <rppt@kernel.org> wrote:
>
> > This a next version of Alex's "kexec: Allow preservation of ftrace buff=
ers"
> > series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazon.co=
m),
> > just to make things simpler instead of ftrace we decided to preserve
> > "reserve_mem" regions.
> >
> > The patches are also available in git:
> > https://git.kernel.org/rppt/h/kho/v4
> >
> >
> > Kexec today considers itself purely a boot loader: When we enter the ne=
w
> > kernel, any state the previous kernel left behind is irrelevant and the
> > new kernel reinitializes the system.
>
> I tossed this into mm.git for some testing and exposure.
>
> What merge path are you anticipating?
>
> Review activity seems pretty thin thus far?

KHO is going to be discussed at the upcoming lsfmm, we are also
planning to send v5 of this patch series (discussed with Mike
Rapoport) in a couple of weeks. It will include enhancements needed
for the hypervisor live update scenario:

1. Allow nodes to be added to the KHO tree at any time
2. Remove "activate" (I will also send a live update framework that
provides the activate functionality).
3. Allow serialization during shutdown.
4. Decouple KHO from kexec_file_load(), as kexec_file_load() should
not be used during live update blackout time.
5. Enable multithreaded serialization by using hash-table as an
intermediate step before conversion to FDT.

Pasha
