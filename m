Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0E41494CC
	for <linux-doc@vger.kernel.org>; Sun, 12 Oct 2025 01:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760233803; cv=none; b=BWuWoRkJ1a5O2T/weUTjzUWZrDCIJPAMluzuWKjkcefksHQK/UCbRX3cdkkPy4SrWzM26JLYmTI65fSY0Af0DyFrujzUW0YMEHxdazoEUqS/DvbcPgQ8YID0m9zCecQhb5q81h7g5RYHuRul+Ja5di0bTJLkoFNX9+L16IwBePM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760233803; c=relaxed/simple;
	bh=GwEwPqxRUTg7MFQelyNf4d+Vw8oD9w/6xNdsusLFnAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5XY0GBYvDRNPVvIbno0KrbfvDDjchxo1gDhbQD3nvVALOX9LCckyGDkeEisKyrAPaSQYf0jkiblERZt9mdhAL6httI1YTbyQBezM8dORQ/Qr/t2dRUZW4jwfMopJCdQDHDpjTP3aPsEABN4K+kJ7virO+DlSSVR3nX8FLJ12lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qw7umEDo; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qw7umEDo"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-85a4ceb4c3dso361963385a.3
        for <linux-doc@vger.kernel.org>; Sat, 11 Oct 2025 18:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760233800; x=1760838600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pXc8uJoaf03/WrAtzQqCEQN2vdeh87i/2lbcZm6q1bg=;
        b=Qw7umEDo67QTqhTfgEmRF5NyNmPimbOCn3AeXRMbmt6MT1Kt1C9VT39jXY/GyTK3Oq
         vGW0JrO88dFSqM5IOj4HItenQaeWdNwYYY2nJZlmbunewloUt47tCIZj65AYxtQ4/jax
         yk2Zuksufen52p9Qx534ULPfZU9KG4QLNuOnJwjIBC4v6Uj1T7Ahjg30h5wPtGdcBi6L
         28HYHWMKlK/fHls7CdLKJWGZzWTojRoZisYp7V43hTwAY0pOY8lTsnB+albx/S2sAToQ
         au3/iHsSQC0MGrUPgxXVrs4sEl1vRHYeAJl46MwYgoRblu4gXCRPw0wv4InDG/J4fqam
         kdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760233800; x=1760838600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXc8uJoaf03/WrAtzQqCEQN2vdeh87i/2lbcZm6q1bg=;
        b=iLqc7Y6lpW5tIrsC3axmfb2MA8CLW8WJ4Maye8jQTsv2N7wltn83opYHfiAUvNmFZa
         T7c9i0MH8khslC4AP6u15Z7mV8K9h2D0u4govoi/cWS2PSxxvhQZVuV3On3ZdT9qrWnl
         8gvLMEMkzWaTwbGE+UCwAj5XVdCO/nUzSXiDsOonbdfXTiCvD9mmlKNr5oI2ACX9V1vC
         WLtZV1O+DJpZav48WZxxQRzrDHNqALJKa+F3ayXExNsWkJzrASSudwxf2i6t/m/zuio6
         KKdjlV9Lw0o/Tfzf3kxIvKsGvQbCKTog9+Jd7XEkdpnzzrpv4Ti9NXBq1UZpIVoQGCX/
         q9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8URg7mumfPOLDLf/GFaP1vvDbcY3RpRYjmjDwWHOGlD2nxpGws17um6evbz1zWO3506TjiH9lOzs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynpy87eD/4UMDwvgdSHOnx+t+0I5YY0wJUX7A3gnYDng0eBDwV
	UgtqjyijBN9GdPzIkSbble15hK/PjOVCQHm6S/K7ckkdUqbQ3m62OZ7d
X-Gm-Gg: ASbGncvdelwQHUGAx4mLC+hPPx1tfhpDo9zRg/7DcqQ4Ho6Bdk5k3ZXG+3jJf8vr+mm
	XK5dSl1L6/TcrbY6fBTJsGVEI5z0O5D10sAsD0LYYhwSSFitPLN48/xBDf+4JMjc8s8H2Veo4iI
	7vfzoi2h19hEomfZ6f8qR2Dv3KIrSlWQokQSMDZqwyVk2Aim9T/qhFXuQmn2QGHaZeThLHNhCp/
	9NQu/b+Z82JvaUnLKaaxnhwZIFqu36PQndet5Dd34MSvVSCfNJLxFdMhorVeMv5fbgcBVS/nXpt
	hGrA5aTCsfFMCV8KWTAl1tPE3Dr8G3m7K0BOARO/OwxK2xsUVZjAkAUefPSxUzJE/5gnRxJhldT
	EC0TxRmsV0ru7vTxtv+KkRf6AI+nPgWGKsTEi9c6qGLSiVbg0Q4ataQXJm5+D
X-Google-Smtp-Source: AGHT+IE9eDjN8qiC2CBml63k30/pJPBpkqgYgHXrbEQP5D/Xfz4Ph8hYr31jfcSgiLzmPEPGXHXV9w==
X-Received: by 2002:a05:622a:1828:b0:4e5:6f10:5aec with SMTP id d75a77b69052e-4e6ead5afcfmr225132761cf.63.1760233799442;
        Sat, 11 Oct 2025 18:49:59 -0700 (PDT)
Received: from gmail.com ([2600:4041:4491:2000:4a9:9d37:4046:41e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e706d5f704sm49290051cf.26.2025.10.11.18.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 18:49:58 -0700 (PDT)
Date: Sun, 12 Oct 2025 10:49:55 +0900
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, g@gmail.com
Cc: rostedt@goodmis.org, mathieu.desnoyers@efficios.com, shuah@kernel.org,
	hca@linux.ibm.com, corbet@lwn.net,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 0/5] tracing: fprobe: list-style filters,
Message-ID: <aOsJQ3gMcg5oKy94@gmail.com>
References: <20251004235001.133111-1-seokwoo.chung130@gmail.com>
 <20251008095111.5732b065dcebe53fc80063c5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008095111.5732b065dcebe53fc80063c5@kernel.org>

Hi. Thanks for the review.

On Wed, Oct 08, 2025 at 09:51:11AM +0900, Masami Hiramatsu wrote:
> Hi Ryan,
> 
> Thanks for update!
> 
> On Sun,  5 Oct 2025 08:46:54 +0900
> Ryan Chung <seokwoo.chung130@gmail.com> wrote:
> 
> > This series aims to extend fprobe with list-style filters and a clear
> > entry/exist qualifier. Users can now specify a comma-separated symbol
> > list with ! exclusions, and use a spec-level suffix to select probe
> > type:
> > 
> > - funcA*, !funcAB, funcC -> entry probes
> > - funcA*, !funcAB, funcC:entry -> explicit entry
> > - funcA*, !funcAB, funcC:exit -> return/exit across the whole list
> 
> 
> Just a note, it should not accept spaces in the list. The space
> is the highest level delimiter. I hope actual implementation
> does not accept spaces. So something like:
> 
>  "funcA*,!funcAB,funcC"
>  "funcA*,!funcAB,funcC:entry"
>  "funcA*,!funcAB,funcC:exit"
> 
> 
I see. I will adjust the code so that the parser reject any whitespace.

> > 
> > For compatibility, %return remains supported for single, literal
> > symbols. When a list or wildcard is used, an explicit [GROUP/EVENT is
> > required and autogeneration is disabled. Autogen names are kept for
> > single-symbol specs, with wildcard sanitization. For list/wildcard forms
> > we set ctx->funcname = NULL so BTF lookups are not attempted.
> 
> OK. So "funcA*%return" and "funcA,funcB%return" will fail.
> 

Yes. %return is only accepted for a single literal symbol.

> > 
> > The series moves parsing to the parse path, documents the new syntax,
> > and adds selftests that accept valid list cases and reject empty tokens,
> > stray commas, and %return mixed with lists or wildcards. Selftests also
> > verify enable/disable flow and that entry+exit on the same set do not
> > double-count attached functions.
> 
> Thanks for adding selftests and document, that is important to maintain
> features.
> 
> > 
> > Help wanted: This is my first time contributing ftrace selftests. I
> > would appreciate comments and recommendations on test structure and
> > coverage.
> 
> OK, let me review it.
> 
> Thanks,
> 

Thank you.

> 
> > 
> > Basic coverage is included, but this likely needs broader testing across
> > architectures. Feedback and additional test ideas are welcome.
> > 
> > Changes since v2:
> > - Introduce spec-level: :entry/:exit; reject %return with
> >   lists/wildcards
> > - Require explict [GROUP/]EVENT for list/wildcard; keep autogen only for
> >   single literal.
> > - Sanitize autogen names for single-symbol wildcards
> > - Set ctx->funcname = NULL for list/wildcard to bypass BTF
> > - Move list parsing out of __register_trace_fprobe() and into the parse
> >   path
> > - Update docs and tracefs README and add dynevent selftests for
> >   accept/reject and enable/disable flow
> > 
> > Link: https://lore.kernel.org/lkml/20250904103219.f4937968362bfff1ecd3f004@kernel.org/
> > 
> > Ryan Chung (5):
> >   docs: tracing: fprobe: document list filters and :entry/:exit
> >   tracing: fprobe: require explicit [GROUP/]EVENT for list/wildcard
> >   tracing: fprobe: support comma-separated symbols and :entry/:exit
> >   selftests/ftrace: dynevent: add reject cases for list/:entry/:exit
> >   selftests/ftrace: dynevent: add reject cases
> > 
> >  Documentation/trace/fprobetrace.rst           |  27 +-
> >  kernel/trace/trace.c                          |   3 +-
> >  kernel/trace/trace_fprobe.c                   | 247 ++++++++++++++----
> >  .../test.d/dynevent/add_remove_fprobe.tc      | 121 +++++++++
> >  .../test.d/dynevent/fprobe_syntax_errors.tc   |  13 +
> >  5 files changed, 349 insertions(+), 62 deletions(-)
> > 
> > -- 
> > 2.43.0
> > 
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>

Best regards,
Ryan Chung
