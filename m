Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F4431AF2E
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831822; cv=none; b=AVqGk2EoJgnA6Pwvg3osF96psFPCBLkNZZ8NV9CMKmd9ifv6zBZe2swHH1VI6BKeWPiJlkn0nBcPHybpP7ugrFvGHLTKuF4DSunXviwJ3IUGBS5Lw5m+BsfkY3WZL2RtYpxBaaSVHlxS2zZq7uFKKTbD8Di5+z58FfLJXw61d8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831822; c=relaxed/simple;
	bh=6RIt17l6rtvY+nJ0OVVe8xaeq2YQCf529Qu7R8rBWQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehrOHTEIdH7PyMi1qbIXd8amZQopQDgIZyGlvjQQ1rl0sbwVg7Kc93EPyy6eT4csT9apr5ABjlYfeqQOQFwAGwsGElOJummgHTQ+NE5ui0v231/jIuwlUh+2NJe8LryiQ1ns4HpN6nqhmhF65WtpzzVbPLOluVIiCcNpXM0Y+J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iVxktnQU; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iVxktnQU"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b327480fd0so16971cf.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Sep 2025 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756831818; x=1757436618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSyrafM1QcRv6+/JfnS79ZJ1CJUifDSEbVFOqe4QmfQ=;
        b=iVxktnQU/yyZtqB1mdae3VmF0wyDDvDDqcx1s1j0PTIexofEpiSA718bzBpKiOX6w8
         83lSP+TyZqilKHdJ10uEg3P9ERWyc32e3OLf8Tu9TJseIuLxF+EwcAyA0o6f+8EzAM8A
         OqUK7qRzAbDZFNNvLboqlkocnmQbrXGimI9HCJF3a51xpqWANjGE9cNioMyzG7O7VYPA
         47uHqbzkTjlwCfjJcJUxZ4SAwpLOgssfan37jzxc1IkO/8t/pWV+Hb9ExJew8Bly/QUg
         Wmq3Ty5aUZKrWED3sDSDWgqYBfsifpLvN0scFj/qnM7NjcTevkUFrwMSUqbXdu6HNRDb
         l+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831818; x=1757436618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSyrafM1QcRv6+/JfnS79ZJ1CJUifDSEbVFOqe4QmfQ=;
        b=JRwr2kiOv8FKW3bKKmE8GUfZrfMJfsedX2dLY1UAr7vX9JlDfARASp1hSfAnQzHh2Q
         BlCViZ9TvQRXVj/S6FUkvgyVytMQUhh7Fhu0F9DA9s4sSiUOJUlWPfZMJU2Dt6ZS8XQq
         AUSefj6V93pEE7K+UknePf2MXjNJ9Y6km4Zaqp2uZYUfTuC466cJEyvmfh9XZG/bPqhk
         HY+8JBN8f8TALV8uVKzFubNzNg1gyBbFLmI++3wZUQIqqMRymZ1pHi7Rg0KbmH2VdRF6
         U++PWmvHFPofq3RnN+T/yOvvgR/2as94+XQlbToHtERLKBZQ63ZhpTM9LPtKZEsoO4/L
         dVPA==
X-Forwarded-Encrypted: i=1; AJvYcCVv+sFyTdNLX+O8CKwJBFL9XlXoGrQUU6cPKVoR2i0gL4UAaflvH57qVd0yLW9Is0SI1iT4tiqtr+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoBYeDTL89xWY6VYByhqnxo705C+8mytBE9NvGn5hIGkf66itD
	axDEcfUzmKdPYuhQSoEnOyPGdJ99IgXk76seQx4Eoo1S9BFOnBWxa1CTIRVRLJ7bKvGzAPbXoV9
	yB6xvfRZWpFt4oAhqxRch2eqxfmQpTQugWiyYUP8O
X-Gm-Gg: ASbGncs2nNije4X/MWhxJUxScTL42tGYDRsZJoOJ/F/eDI1xDJPNo+PV5MMqDilMCNx
	pNy48+zqObNt4kteajPieZTKVdRGOAy5uzbC1vyq1RFAbizsTFjCjGvXV+JNd0ToQqt+LsJU5Q5
	3/rpC4pPBb++jYzVJOS2aMoqOAGP2AcayjYG+2/HjeM0QVCVsFQgVl1RRJyuNgXaO3x2z/r0+GQ
	q+Qy4XyxWLNm5qKFllV0cR7AuQc7zIY/KCoqP6WT34=
X-Google-Smtp-Source: AGHT+IFZRZdIhfajnXhlEKBqcpQ9ut7xCYenusy5bPozjAHfG8pzHkYfdT7cPUFCcvttQ5R84/Zpo/4ZOtaDR+q3ZIc=
X-Received: by 2002:a05:622a:a28a:b0:4b0:9c14:2fec with SMTP id
 d75a77b69052e-4b325008444mr11392681cf.8.1756831817870; Tue, 02 Sep 2025
 09:50:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831150710.1274546-1-harshit.m.mogalapalli@oracle.com>
 <CAMuHMdXSNoXjxAbALr7O_dD_btJDGR58XaDa5=bd8NmL50wcaQ@mail.gmail.com> <d2a5b07e-2da1-47f0-b2cb-a4ffa12a99b0@oracle.com>
In-Reply-To: <d2a5b07e-2da1-47f0-b2cb-a4ffa12a99b0@oracle.com>
From: Rong Xu <xur@google.com>
Date: Tue, 2 Sep 2025 09:50:05 -0700
X-Gm-Features: Ac12FXynsWsvMltp57ATRpCXmM0Uhwu2CvmIEafU2UjtQeosXaKLslnu08g_VGQ
Message-ID: <CAF1bQ=TB6KMAkwXfEF=ZJvJZqV8B9kEw3jbVMG4gRoLOUjksiA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dev-tools: Fix a typo in autofdo documentation
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Han Shen <shenhan@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the fix! I meant to include "/" in the original patch, but
I overlooked it.

Reviewed-by: Rong Xu <xur@google.com>

On Tue, Sep 2, 2025 at 6:03=E2=80=AFAM Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> Hi Geert,
>
> On 02/09/25 12:43, Geert Uytterhoeven wrote:
> > Hi Harshit,
> >
> > On Mon, 1 Sept 2025 at 17:57, Harshit Mogalapalli
> > <harshit.m.mogalapalli@oracle.com> wrote:
> >> Use cat /proc/cpuinfo as opposed cat proc/cpuinfo.
> >>
> >> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> >
> > Thanks for your patch!
> >
> >> --- a/Documentation/dev-tools/autofdo.rst
> >> +++ b/Documentation/dev-tools/autofdo.rst
> >> @@ -131,11 +131,11 @@ Here is an example workflow for AutoFDO kernel:
> >>
> >>        For Zen3::
> >>
> >> -      $ cat proc/cpuinfo | grep " brs"
> >> +      $ cat /proc/cpuinfo | grep " brs"
> >>
> >>        For Zen4::
> >>
> >> -      $ cat proc/cpuinfo | grep amd_lbr_v2
> >> +      $ cat /proc/cpuinfo | grep amd_lbr_v2
> >>
> >>        The following command generated the perf data file::
> >>
> >
> > One might say the path depends on where the proc filesystem is mounted =
;-)
> > However, all other documentation (except for two occurrences in
> > Documentation/networking/proc_net_tcp.rst, which you may want to fix,
> > too) assumes /proc, so it is better to be consistent.
> >
>
> Oh very good point, yes I did check other instances and thought we make
> it consistent.
>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
>
> Thanks a lot for the review.
>
>
> Regards,
> Harshit
>
> > Gr{oetje,eeting}s,
> >
> >                          Geert
> >
>
