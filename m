Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3604225A34
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 17:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739812847; cv=none; b=psYMMESv/kwvztVYV94YHq9Vn9yrlZqhiE7ajRFHK9fzNiye4Zy3xoDv7uBiiPmukEMVhKuwqE7exkHuZ7/KKKiNO8DtfzAn1xJ/BWfr7fwoaFBwpdIIpIFKKkR53U7gcxrhQtbOXgD5+mQowxS3hO6x739kW+v2UrJB9NELFZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739812847; c=relaxed/simple;
	bh=KitNqb1hNItZph35zvXtWR51tXJ70TMYSOy5bT0CeFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4DdC56pgehtve3FJXHnkVGDW2u+mM+vmtFnpPXsuV+z4kHgrDcKLjUkhxTF8FLVvBbUbX8N9OblrbrRTd8lXO12SG5gnQDr310F29Fk2ST00DE0VzRaraFs0BQzI0oaxsgqZ4SU2dV8gWA9ExHjNpRq4SECzavN1X4/d9iB3o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hqri5vQf; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hqri5vQf"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-471fbfe8b89so101081cf.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 09:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739812845; x=1740417645; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KitNqb1hNItZph35zvXtWR51tXJ70TMYSOy5bT0CeFE=;
        b=Hqri5vQfE6X4CmbPI+wat/XNcpXNIfrMSsPUyM7hEWS4BjROAc9RDS0INUy9TTmedU
         Kfmwxny0sh9P6lVvPYW8haRcBySc+mMNNRoSk0e0BY68Z7kjGagTSioTicAgkfh5lSyU
         10G2BIs/qMWCiVW5IAjWmM55ZfwgMoc2iY3vp4UuzZTHSU0UkvoFAnmai9BUCp/tuUmP
         Ik7Zc0um6co1yT9/lMneHHpks8agb1WJKnSrTeMZ+HvMGmmZgn+MWeiqp+HqZvrysf/Z
         PLQ9ZDhhJT3ve12eGid2trM67y5v8QXX+OQ0iIWC5CnE9ifk4vE9ir0wTa5Tb//887Sj
         PWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739812845; x=1740417645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KitNqb1hNItZph35zvXtWR51tXJ70TMYSOy5bT0CeFE=;
        b=hpw34m5tnyKXKoSUwSj2BTXwmrPaN6d72sfZnziNnOhQvA+9rHH60FFbAqTFZgxZWH
         ZmHhcX/OwRL/sMQxjlLUufQIinwxPj/1Odbo4/KtM/WNIR1bgAhMshoS+8DXETnxuzv7
         M2LN3zQbc2pQfir9PyuYD895PeJ6Fysssoj7bJFYTCtRFM61tke/fOWziW9xnqtJhQvz
         C/xy780JmXkhIANSxnKBXNK8y4O48SCHZAqg6EvXt/XLKChCx2aY7qZ3gIcjLRPPIIVr
         q5//sOOI1cIei3x5RXR3mJeCfdyT7Y49bf4/nR1SU9fAPOhsk9vHEnM+IIiYhoGFoaFO
         z/sw==
X-Forwarded-Encrypted: i=1; AJvYcCX1z33fIB045f2W+YOH4P3QXEMh/lmR+KbRjD7Z6PXery9yjKLlT2a6RkVBIja/+/cUE+aeUN+KQ+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YylqifKFZgdH6FabJmZsOoNQGCVSnCHotLB7AwuhtxDUQGw0A6P
	7Mti9vqujaKgf3F0dDPc3zYiWSx+ue7bNfKmEX/mI61kzl57bN4U1vCuRnBR5J2ALXp6jq/SW7U
	ygruuHq+3HIfGfxAXJO+RHqcWJBIKuH53l0XE
X-Gm-Gg: ASbGncvCD/YXmRX3/TjIDH2jlZjuqoCILAak/mjuhFMQW2qT65r0eGi2LkzZU57FGxH
	6dRn3OxkR0HZy7Em3oDLxIMEVLeResmXjhJg7mJEryA6pzL6q7wbBnTb40+toiLBxgki3eMVu9/
	Aw2AOJjiOcuhz8AiCiH31GNhHipmI=
X-Google-Smtp-Source: AGHT+IHtSBo94EPpnG7ESdGyKa6VP68eV3ZrRwK4VaJPxYG/Im2Y0ZICU1JdsATecA8kZWmkgxucfSYewavfDnZgqnA=
X-Received: by 2002:a05:622a:22a6:b0:466:8f39:fc93 with SMTP id
 d75a77b69052e-471dde5f57fmr7315731cf.3.1739812844746; Mon, 17 Feb 2025
 09:20:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129-force-cpu-bug-v2-0-5637b337b443@google.com>
 <20250129-force-cpu-bug-v2-3-5637b337b443@google.com> <20250217111029.GIZ7MZJUGJRoeiScgn@fat_crate.local>
 <CA+i-1C3fetiBYVbfpAbQEAnogzdza25pu2DosCiTT9YkXwt0yw@mail.gmail.com> <20250217170817.GGZ7NtAf-mg-zySpdP@fat_crate.local>
In-Reply-To: <20250217170817.GGZ7NtAf-mg-zySpdP@fat_crate.local>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 17 Feb 2025 18:20:33 +0100
X-Gm-Features: AWEUYZlSXLSAfoE9pg28Ca8tCxl2r2aeCJtImtIUaZOuCIeuoNl_kBUKnQ8H2SI
Message-ID: <CA+i-1C0=tDMpfZqNq0aWns=cj70UOOmCAPOonmJi+MM7B6G9Kg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 3/3] x86/cpu: Enable modifying bug flags with {clear,set}puid
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Feb 2025 at 18:08, Borislav Petkov <bp@alien8.de> wrote:
>
> On Mon, Feb 17, 2025 at 05:56:32PM +0100, Brendan Jackman wrote:
> > Er, hold on, what chunk can be whacked? Do you mean delete the ability
> > to set clearcpuid by number? There are still features with no name.
>
> Really, which ones?

I just mean the ones without a "name" in cpufeatures.h, e.g.

#define X86_FEATURE_MSR_SPEC_CTRL ( 7*32+16) /* MSR SPEC_CTRL is implemented */

> Are you saying you want to turn off *arbitrary* features? Not only what gets
> advertized in /proc/cpuinfo?

You can already clear arbitrary ones with clearcpuid.

But for bugs, they all have a name. I was thinking that this was
because they are defined by the kernel, that's what I meant by "It t
doesn't make sense for a bug not to have a name", although now I think
about it we could totally have a bug and not give it a user-visible
name if we wanted to.

Anyway, still think the current logic is what we want here:

- The new setcpuid should be consistent with the existing clearcpuid,
i.e. accept numbers for the same things clearcpuid does.

- There are currently no bugs without names so for those, require the
string for both setcpuid and clearcpuid. If we wanted to we could add
number support later.
