Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963552C11FD
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 07:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765436645; cv=none; b=kGCkLPupWjP1clCZAeC+AYS9mggf9HQyNWpG+On+BjRTyainx2WihawjUrwua2LRISYplPqPWZ+YpzCSzt32LHVk1jLanB4sKppTOv4ezws/NzMyhCGH2trGqvw3eTmRF2dowIos+pl9/5rqFH+RFF+P/IV5PLaUGU50GFjpTdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765436645; c=relaxed/simple;
	bh=zQ7Q7VL7sRSVbVPf7t4SPc1mIdmYtIM0mA1LyLVTGyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTvQT9FL2z22APjkRPgdPA+Uz7e26SsJFXuJavnifE1SVCu8be/M4XYDQ25OMeFFB8R2kd0FO9k8RfRg+QS7JpYR23jrfWrJySz/AEJkUMMYwrkTSZcxO0YjJy2kF8uTFSjvfhoCVTkBFB/ZIwwk75aV2GGPG3WXeGjFc9vy+qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sinthbid; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sinthbid"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64165cd689eso2631007a12.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Dec 2025 23:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765436642; x=1766041442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqt/EzBZObqd20FZ4KVaKSHRTroDrVMqsGCtVl7ltcw=;
        b=SinthbidhVKE8KugcMukgPHW8vKj9RCAyhiS3BIDOUuYD/07OUl98My8fpeqlEdXo8
         Ifm+TSnbk5wQ1uMi+1OgL67q1wsNK5M4CWRYZQH6Zd/tqwlfLhsHANjjg/0Pc6GN6tgK
         lsAAe15BKodowV7fOEVm/ztj+soQhlJu0BIfCTHLkdjXPZX3KhuH8gynfefUvThiOaW5
         TY5tpVhAOIuZojvf3pY9xi0GCSk7T+IhAN80/Ja/5rW5RcRU5CqxAKTZrZW69htTq9vv
         6eMaGwcDjyBENMGp/iHk9ujmVV5diZosjRhGdbRT9N0PzYtxzGrh4JR7EhNzB4oSd8Eb
         Y2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765436642; x=1766041442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aqt/EzBZObqd20FZ4KVaKSHRTroDrVMqsGCtVl7ltcw=;
        b=f/Nsf7Z3+A5cDllanWu0adMEp2I4LMiVBrWbI+LaZxHywt8znVl8FT3nWFtbKmQbRy
         Hq2iZu2y1pcRMOCwZCUviRGFDCiLPmsapR4SMJFSoZ0mEVa+PhDlWPcMX31No5WIRbQo
         Jff9M4/o523Nb5NgzxmOWJKAJV3nPoDLRdIHiYY9EE54tGec3i7H8iZhxFcV1B0bjG14
         9uAisKxsThsGow1vgCqLqFPDF+cF7wCkoJm722O2FL4SaaKjtwPXrktG3jtW6FVmiJUm
         lXBzRUoz5wL8Y2jbzZ/4NN9lmYSzwNiAlVY23Q4x/cQgkUwyx5Da3zAxsDm5Uz3SA9G1
         fG3g==
X-Forwarded-Encrypted: i=1; AJvYcCVLkHA6KXHXOCwdmLYNJhuXX1drmN82GIkMmkz8aL4MyzZVObvNs1VPtL3ZbUot5yGq6ympXJpttNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMpBOgujA4Qt1NtAVRC//+FKptIgR75hjsA4xNIzURVJvlOZxw
	PE8i+ftvdNUd9+eNYGyWF3PimsPfjnlv4gbz1EyZj7CuFcbe9UmN+m50I+BuePyI7svhoFboLdS
	wQ5Mjf1P1tKvCmob7GOhS5bMjj8eqlT+pWqYDBDg=
X-Gm-Gg: AY/fxX5FPm2AFm7+jWp54rrASVeWbf12I6GYCUOf8svqn6X+q/RSnopLkelyaCkV64T
	PiiPFT0fvIhMH8BGvabtvYjd3945j5egYGsOqb+xLZqdF4xaSnO4AGq+/hZIYaSaliGIVCVvuo7
	SbenEZqYR5HJ8dLEU5giPAnvL5hmsHbW/0ULrDJtuBg9B38Qtw+17vUpuOmXpX5d6ed4K6R+A/F
	qkqYwQA9lSdgEcOpnKJWMDIsVu748cG3kh7M4yiLfyAOhjJq+fT0NVSuCYSB8bsfXx0CYQ=
X-Google-Smtp-Source: AGHT+IHRoGna7wBwP8J3yXgxuFLEUOGQtVPJKwsIPRNms/46Mdj3fPrFPHjrti6IDJ+PwIqwRowNFCdLYUsN+qzW4LU=
X-Received: by 2002:a17:907:7f88:b0:b46:57fd:8443 with SMTP id
 a640c23a62f3a-b7d02b63fcamr118124466b.24.1765436641696; Wed, 10 Dec 2025
 23:04:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240406081210epcas2p1736b44763ba01114ce3a552aff50d780@epcas2p1.samsung.com>
 <20240406081126.8030-1-bongkyu7.kim@samsung.com> <639691db-dec3-e180-3681-00bd966c90a5@samsung.com>
In-Reply-To: <639691db-dec3-e180-3681-00bd966c90a5@samsung.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 11 Dec 2025 16:03:50 +0900
X-Gm-Features: AQt7F2rE14oJAEP872TMY140M921RwzKDj2g1nPC3S2my_r6Ve0g6Zr-ybBio4o
Message-ID: <CANDhNCrz=3Xp=bfydZycPgzr82YVHYk00LeaKSf9dQ5DA1Z5vA@mail.gmail.com>
Subject: Re: [PATCH v3] locking/rwsem: Reintroduce reader optimistic spinning conditionally
To: Bongkyu Kim <bongkyu7.kim@samsung.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org, 
	longman@redhat.com, boqun.feng@gmail.com, corbet@lwn.net, 
	gregkh@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 8:08=E2=80=AFPM Bongkyu Kim <bongkyu7.kim@samsung.c=
om> wrote:
> On 4/6/24 17:11, Bongkyu Kim wrote:
> > Reader optimistic spinning is helpful when the reader critical section
> > is short and there aren't that many readers around. It also improves
> > the chance that a reader can get the lock as writer optimistic spinning
> > disproportionally favors writers much more than readers.
> >
> > Since commit 617f3ef95177 ("locking/rwsem: Remove reader optimistic
> > spinning"), reader optimistic spinning was taken out is because of
> > reader fragmentation especially now that we essentially wake up all the
> > readers all at once when it is reader's turn to take the read lock.
> >
> > But, on smaller systems with just a few CPU cores, reader optimistic
> > spinning may help performance. So, reintroduce reader optimistic
> > spinning and enable it when the number of cores in the system <=3D the
> > threshold (default set to 8 cores). This threshold can be changed by
> > "rwsem.rspin_maxcpus" commandline.
> >
> > The simple heuristic of skipping optimistic spinning if the lock is
> > reader owned is kept, reader optimistic spinning won't affect handoff
> > handling which requires that an unlocker see the lock will be free and
> > wake up the head of the wait queue.
...
> Hi Longman,
>
> I made a new patch as you suggested.
> I would appreciate if if you could review it.

Hey Bongkyu,
  I just wanted to follow up here to see if this patch was abandoned
or if further discussion elsewhere resulted in it not being
resubmitted?

thanks
-john
