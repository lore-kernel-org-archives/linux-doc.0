Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF74835A921
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 20:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761770667; cv=none; b=PK9OhnPYnEcrDDfkvdqg7KaF6l83cRnBCi+9hjQJpr305yqdpI+r26jFXypq7N8UnNb4qBjh7ah23zmrLRhdqwGWPEpbe0GjHrEOCDOk1j1UnUE4oCGjGcUY0RZGWX+PCys/FZMhhTRpaIRXB6tiS2PkTebOA3zbi5BPENs4/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761770667; c=relaxed/simple;
	bh=/nRyrHH69bDwdkUwV+ZvUiMlkERSxLC5qY0L4yNkpAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqKO2JP02B/6FvE95ncwlphdP9HlRDeoh3rY1DmUiClj7sZo4g0X75mH4GlMiqnq2fVXJ3kOA2khUDBGwn0gE7LTsbpyeOHIUc80GMhygKKOgHbbLKvv7nC7fX7fDJmYM97nLsiI55lYtnXYXxeAG+FLpKYXdbiA60YwtX3Km0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZIT8FZH5; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZIT8FZH5"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-378f010bf18so14819061fa.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 13:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761770664; x=1762375464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nRyrHH69bDwdkUwV+ZvUiMlkERSxLC5qY0L4yNkpAA=;
        b=ZIT8FZH51950wDS/bjbvoKGOA8qhHonV7KO9v4ASHE/9xRn3ynMtghPFcpBjOistJH
         2lDJC8qO5e33qWIzdICHnbPQyQbleSTxhRTXXmBRLGOGCyZzy+q1Sd+c4kD9S/keZClS
         MZt8ZPz7P4MLIzfxWg2TmnOnQZh1igfmm8ZEeJ8srgrqVAyq+4zbSyFWUbE7XBWoPObj
         jw6yyodMDdTkDAscIF6SN8BwOhAbZUdl9M4vi15xPNeKdSfMqdZWqtIpGdFgtw+Sa8tW
         WjRpVWRJwEG8tvxYBPzUBdlm27ROSFhNUxSh/hDPDKJJLfUfuJmwJAxMt1X6eC6zK8u7
         BRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761770664; x=1762375464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nRyrHH69bDwdkUwV+ZvUiMlkERSxLC5qY0L4yNkpAA=;
        b=nsQ7MU/e/lOinI6eryw/Nx6eJf/zqCpX++Z646jIK7/+rts5PCR8SguHsLsvjA7Ay3
         eCkLdIh2N+fpDgtLvSjgfxdMpnrDxaD2JzbbsBu2Ktxnb3avKIYi6FxOwWuN81y1Ufx/
         eIcec/pPo2j3saFYC1jAs7W5ZVE2fO5Yr0IhgR4GTMhPX/dtUNN4u5XCU4Bk5OKUvm4H
         kMeCaQr8WY+8MbzulP1Qc0VJiN2Omm/n8+wiGXfdkzIFkWh8aucgaqp8cZ6/MhaUUcu6
         m2h1RLAA3DAFEYs1uOtDhOzhQdk3ulvncffgmmTm4KJTvx/8lU79bUWNd6Xc/mo1FKj1
         pN6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHNEBqrOXe/U6wJF5tPPtUjQMqq4UDBWITMGK1ZpHwiU/KM4TQXJjSnb1AGDUSnW1cgrSZoxAY8uI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh9aaN757ehl/uN6n0haMQBkjCoNA0MBJY1Dy8qB1srVwgDOFg
	w4lAALOfm/mIAzVIE/maufBECeB3G7+3VRTv/x0cec6vHNJk0V84X6x9+qFc+NudFSUxZvsZDT/
	O/SbB2lOMM1sJX8Fquzn0VsTHiMznhu4rmGGdao/8
X-Gm-Gg: ASbGncstVD4WPOAFJautXFNmEI2Zrw7EgShoHv/UQER1x7JcVgidGWUw2jkzuCDillJ
	kwcs018zCJiPalI1M6GICdlplfhI2tE812wXg50hCACo6sBpVT5C3qz2coBzgEzfHzGMC9EVVUF
	QoO4bwh9HQdx7vaS2fX9iyHt1WGazNJAZuasU9fXL1F69fVOzK0YFADkLmJSUcTmDFqOCQ7FIH5
	KdRmif/MJWqN/5yK00ASxTg1dJl2ecO+ZZJuTqpWa2ysUUOEmM6AeTRKM2x
X-Google-Smtp-Source: AGHT+IFRYtH5XfTJnxxGfkJO0Gi6f1H2nFBXWvOk+OBKFsn98ppWQIAtWYQQwdGEa9VK8XbxcXnwXcPQMdyC3mUpVtI=
X-Received: by 2002:a05:651c:32a6:b0:378:d020:b6b3 with SMTP id
 38308e7fff4ca-37a1068ccefmr2106821fa.7.1761770663502; Wed, 29 Oct 2025
 13:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
 <20250929010321.3462457-15-pasha.tatashin@soleen.com> <mafs0tszhcyrw.fsf@kernel.org>
 <CA+CK2bBVSX26TKwgLkXCDop5u3e9McH3sQMascT47ZwwrwraOw@mail.gmail.com>
In-Reply-To: <CA+CK2bBVSX26TKwgLkXCDop5u3e9McH3sQMascT47ZwwrwraOw@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 29 Oct 2025 13:43:56 -0700
X-Gm-Features: AWmQ_blzsfm8AU4aSmOo38Baxqd-QolYtNvPxHfj3yJKEB0u3KTJVZdMqBMfTX4
Message-ID: <CALzav=d_Gmb8xKCwWCGsQQrdxHJrnk5VP-8hvO6FugUP7_ukAw@mail.gmail.com>
Subject: Re: [PATCH v4 14/30] liveupdate: luo_session: Add ioctls for file
 preservation and state management
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com, hughd@google.com, skhawaja@google.com, chrisl@kernel.org, 
	steven.sistare@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 1:13=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
> On Wed, Oct 29, 2025 at 3:07=E2=80=AFPM Pratyush Yadav <pratyush@kernel.o=
rg> wrote:
> > Also, I think the model we should have is to only allow new sessions in
> > normal state. Currently luo_session_create() allows creating a new
> > session in updated state. This would end up mixing sessions from a
> > previous boot and sessions from current boot. I don't really see a
> > reason for that and I think the userspace should first call finish
> > before starting new serialization. Keeps things simpler.
>
> It does. However, yesterday Jason Gunthorpe suggested that we simplify
> the uapi, at least for the initial landing, by removing the state
> machine during boot and allowing new sessions to be created at any
> time. This would also mean separating the incoming and outgoing
> sessions and removing the ioctl() call used to bring the machine into
> a normal state; instead, only individual sessions could be brought
> into a 'normal' state.
>
> Simplified uAPI Proposal
> The simplest uAPI would look like this:
> IOCTLs on /dev/liveupdate (to create and retrieve session FDs):
> LIVEUPDATE_IOCTL_CREATE_SESSION
> LIVEUPDATE_IOCTL_RETRIEVE_SESSION
>
> IOCTLs on session FDs:
> LIVEUPDATE_CMD_SESSION_PRESERVE_FD
> LIVEUPDATE_CMD_SESSION_RETRIEVE_FD
> LIVEUPDATE_CMD_SESSION_FINISH

Should we drop LIVEUPDATE_CMD_SESSION_FINISH and do this work in
close(session_fd)? close() can return an error.

I think this cleans up a few parts of the uAPI:

 - One less ioctl.
 - The only way to get an outgoing session would be through
LIVEUPDATE_IOCTL_CREATE_SESSION. The kernel does not have to deal with
an empty incoming session "becoming" an outgoing session (as described
below).
 - The kernel can properly leak the session and its resources by
refusing to close the session file.
