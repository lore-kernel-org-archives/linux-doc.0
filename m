Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363D14036F
	for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722036177; cv=none; b=Cr9lwB3fWfZCig1r0BuxcWlPDIigpeo4lHo/AmncdkqGxO/hyDBFEGuEn/otfUH2S0BrXDcZximTMmhiRL3S+Nt/N2HT1cBnK+onuNy6c0dR5F78nQbnKB7AmoZW72PNwWRIZMTWV3bzurnSRoUV6VzdT10xe5vra6miXlzvOCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722036177; c=relaxed/simple;
	bh=IKxghHVChIXnXos90EfbL5u+Y9Ui9XCrKs29y1Luwdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzJo2sGouMkNZaFLjOoAk0Cvj0Maw7rbH77fKQb9gzK75oZRPMRlvJkq50sQh80Uv4U+pS1jDO718BW40JNfkSZbDBfGxhONdB2miYAxZW9IcAj0VeQC6FKUW0vCjMckWRGfJVXIOdAphJ+M1E9jcIIIG5ECXBTQAnq4ytMe3yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TYomeyZW; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TYomeyZW"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5a18a5dbb23so4892a12.1
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 16:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722036174; x=1722640974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZNNSZMzn6i47DCe2xBs0leuubfs1arFvSLHk0GYKGg=;
        b=TYomeyZWQvmu46ZSzHjbzb7NVGmWp/8zMy4wdfOdaVyakae+Igi2Tn3nZ+NubFrapf
         lkRwgLEPig8CtEIGoQEvERqqo7cvJRKXXjSgy0Vcvyvwgr3qdiKjEnkm7qRDYGdNq1BS
         PvTbpM19pZyIzKacnMyI4YmxHhYtVyQAJKU3qz6P0vsk3GcD8lw0VgXefblLAnfs7h5F
         JvGi5l5Sd3Of39zvaWYqJfKWw9oVfEeeHRkhATAOksiqTQ00xhaJScCpioPJhwuJRejG
         Y7ODikMBAsgK5Pa46JVm4AOq8lmXYy+LcX1wcdY4qHSbEyVJ0Cm6Z+xW6Y78ZOvV/pX/
         b7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722036174; x=1722640974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZNNSZMzn6i47DCe2xBs0leuubfs1arFvSLHk0GYKGg=;
        b=ARV6/oagYSyZKhHCGhEXePt9+YMFK855OlHjSCbNAdv4Q+BEbbp7+7AKYaWkIgzTAD
         dTY2NPs7wavz46ofcD2AEjUOAGukTH6NPIl7k4dRdjCA729c5Mwupe/+VR+ZAbNxxblx
         x/GQuud3WyQaLljWUX76fsWfJjWDlvGlvzDK7Ls9quFuMAy5keIogO3SWKz/uRdB7OG3
         blaNJClHjALCCOsU+HilnxBLsupsnsahTaYzHKIpBo06QAeV0VHOWGdDIdURiezIg5Yc
         w84VjJuM4U0gR1S42zGkjTWGI/iilNt8TIdm9beUCHkwJoGo3GxSFEEtuk9MwSPNKUnm
         Yo9g==
X-Forwarded-Encrypted: i=1; AJvYcCVQMH8QYWE5eeGgtcsx7/xVwotFhyj3MF+8x6WBXJurULmZadzFuVDOCq7y2gDMrm5//NR7YHEcLXQFigK/GRaRUDtdKUcQzSnP
X-Gm-Message-State: AOJu0YyLi3j3wezSl6F0wUuBC/yKq5duij5MjkDRb9j2XDL/t94XJyp+
	QF1ckOcDSkRgE19SCo3P+IM3QN2fjcsPkkvVNbNepALKYP2pvgbiXBaleuNMXlaRkvhep40d8d5
	92ChwPdEvw31j+DSbaidKEwRkoED7+pfja+51
X-Google-Smtp-Source: AGHT+IHt9Uq65XfnKaCA97ZUMZoINBaVf36k/CoJKmz7iXEiad7O6plKSkr7zWYvtPhLNP0Ie9Al7iB111zShXYxq9U=
X-Received: by 2002:a05:6402:524f:b0:59f:9f59:9b07 with SMTP id
 4fb4d7f45d1cf-5aed9392d97mr284287a12.4.1722036174167; Fri, 26 Jul 2024
 16:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720043311.git.babu.moger@amd.com> <89b7b4c59f3389034337301c1741ce224e19061e.1720043311.git.babu.moger@amd.com>
In-Reply-To: <89b7b4c59f3389034337301c1741ce224e19061e.1720043311.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 26 Jul 2024 16:22:43 -0700
Message-ID: <CALPaoCi2dKoqGEPO6JDLG-4ce8y=uAg-9znQfNo6xg_0k=TknA@mail.gmail.com>
Subject: Re: [PATCH v5 15/20] x86/resctrl: Assign/unassign counters by default
 when ABMC is enabled
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, fenghua.yu@intel.com, reinette.chatre@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org, 
	peterz@infradead.org, yanjiewtw@gmail.com, kim.phillips@amd.com, 
	lukas.bulwahn@gmail.com, seanjc@google.com, jmattson@google.com, 
	leitao@debian.org, jpoimboe@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, jithu.joseph@intel.com, kai.huang@intel.com, 
	kan.liang@linux.intel.com, daniel.sneddon@linux.intel.com, 
	pbonzini@redhat.com, sandipan.das@amd.com, ilpo.jarvinen@linux.intel.com, 
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eranian@google.com, james.morse@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Wed, Jul 3, 2024 at 2:50=E2=80=AFPM Babu Moger <babu.moger@amd.com> wrot=
e:

> @@ -3894,6 +3956,17 @@ static int rdtgroup_mkdir_ctrl_mon(struct kernfs_n=
ode *parent_kn,
>         if (ret)
>                 goto out_closid_free;
>
> +       /*
> +        * Assign the counters if ABMC is already enabled.
> +        * With the limited number of counters, there can be cases
> +        * only on assignment succeed. It is not required to fail
> +        * here in that case. Users have the option to assign the
> +        * counter later.
> +        */
> +
> +       if (rdtgroup_assign_cntrs(rdtgrp) < 0)
> +               rdt_last_cmd_puts("Monitor assignment failed\n");

Supposing rdtgroup_init_alloc() below fails, would you want to release
the counters allocated here?

> +
>         kernfs_activate(rdtgrp->kn);
>
>         ret =3D rdtgroup_init_alloc(rdtgrp);

-Peter
