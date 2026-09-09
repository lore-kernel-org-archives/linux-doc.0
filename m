Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424C54B04A1
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948544; cv=none; b=D5boBUiRyhmHxyeHLmFcNMCVqIn/ZpFqK0OisUGPF+A8Ks3zCyDTMt+kIQlFz1f0Z5BmcCc2BawC2gBgtdk9XSHU12U3rP+iGqjZ4YYX7CcJi4r0If3Tg1KFiXhY0eTRhKN4uztRXgtDUs1wBUqQUmF9Aq4B+lPdIHCmLuETswM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948544; c=relaxed/simple;
	bh=YnBXD+T/yH9/YjPEUD5GRTVBzz7NWd4Ym7TZDeqX61U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9mfFvgdjQBNXpp6GxG6sJ6BDUbtbGoKM2bRIliX7pPiQKTLjHjk1nT1zii6vqFDBSiemVlwClKIR4qQ8VBHw2dEb5c//p0BN/ZQZE7X3RhUGwZawskFVlhRLQRPT/MM4uXqjhfzogbqvFUU1UBbBtaMXgzKic63RYkWoYFASHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/SUNCzs; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/SUNCzs"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8557c3f270eso3780440b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 03:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788948542; x=1789553342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cspt3kRXGk/I1h0yuaYP6XGwO6IhBwUrx4BknaruqsY=;
        b=R/SUNCzszlFv5XUqxaiMH3dJMUblEO0yMxrAfJMeDIFERg37B3JqYwRya+3iApSSIi
         /BDr9ups+L3xtZONBWROMDdDphY9AtVtd4aW//CqdzeFH4a8jK7AyFhGk2D3iL/EVL1S
         yj7f1wIUyR4tf5wXtqfrRimf9vyYtqJ7sVivGj4zzOyghHrEWHAAjLCTojCZF6D4rd7l
         xF0ufs2hUynjbk93bnCFjVKwn/ADUG7TlNrK3SOV5DOB1WwSrxgcsYAeYR8OjhhkKdr9
         JYhxGoVauyKfMjMMg0gFNX84ao2CcZxVp8Hgmy5UQkLZTQGXa0vEWHG2Dwd3PaA6divy
         puwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948542; x=1789553342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cspt3kRXGk/I1h0yuaYP6XGwO6IhBwUrx4BknaruqsY=;
        b=ODNTq5g1XOHZEEUDM826bBe+gYB/bvKblRNnPrYINOg5QdO7N8tivm07kPOGrw1h+K
         P3rHKP5G1J3X2Wm7p2R3uUnummziHOJm8QnErG8MWD4u+VWrd9ePojDV8O4LZJEc+VCe
         SctAgpAqlqtGUNX3uZXZzR0YoMls73UBDGSgmPa+aX/49T0TObVwaEP3CLaHz+mW7A7T
         OLUbi2WOZuDel3dL6OwA7zsQUvtB8+XEwRerZhrbGP4vJqC6k2GODIUvI5d7VmTSy+9e
         bIKT0d5Tn6kk+pMaFdkj6Fe7klVUdHPdSX/bAhiioZimhyhYTJrIUPstofl1ZZ2ZTz2J
         bFtg==
X-Forwarded-Encrypted: i=1; AKwUvBxQamPw2BH5pU4kknk7hipeD8mcnG++oGMj6ImhcdnbabjEpZCojQHQoXUBZB/uHz+lMS6Y+qcvXN0=@vger.kernel.org
X-Gm-Message-State: AFuF++nSN615dka9EMrYO73umYFh0bKKzy5HFIy9rT25NCxjsJOD3+Zt
	h0fXm+Eqn0ogAi6vxl9jNnNOEYLE1Pe6ksFIQyAZ8+UBfdJO0vyFSUpX
X-Gm-Gg: AYBFou1s5lsIrvTWcCMVsgnDx94x8eHaebJfDgRv4l5BxDQL8UU+oNwK0FPMyTC1+al
	g1UCJzEGxkkyj7rkVy0MBxPXS165GdHWqTj4CQkhTJi4hKsFdMnv8jeU/iMiwWXNzPEoAXsmlof
	xrpCRQFvRPL2OF1gdbhzTz7CK62NswBRs/kyfcEQhy2f2cGHjmQOP0Ka+XtztQ03LKNxcZDfiqT
	JU0D0xrjOmzL6xZ/KCoYKt01E64wAAVLZLggwAKCwlZiVfqjcTeO2pbYSlJ/ZhQZUDDdz7Edx87
	yCpmIhludZNLzY2/l+R67K6XXjSEvKwDHLW3Kue9ZUWL9W1Um3WZLrOx5OPxeWK6MR519JstVbX
	dJs6xd7DIiXCehXZZPJt1kqO7FPxYNaEJooehfpXhJRJN6GcfNVTYY1ehjlc0lcV65lZUCGY0VL
	JHUKq7QedkwM5N6+dKvrinA5EO7Sq8G2bEe7vZ6UiYO9ut2rDuOgK0ZTYM39DBgx8Yt/OT752Ys
	cw3pcbu8pcfkpQ=
X-Received: by 2002:a05:6a00:2d91:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-8616bd5c57amr45991902b3a.17.1788948542332;
        Wed, 09 Sep 2026 03:09:02 -0700 (PDT)
Received: from celestia ([2402:1980:885b:4183:b098:c1b9:7033:be8a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152c2a52asm6745792b3a.30.2026.09.09.03.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:09:01 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	damon@lists.linux.dev,
	david@kernel.org,
	liam@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rdunlap@infradead.org,
	rppt@kernel.org,
	skhan@linuxfoundation.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [RFC PATCH] Docs/mm/damon/design: clarify when qt_exceeds increases
Date: Wed,  9 Sep 2026 18:07:33 +0800
Message-ID: <20260909100913.30568-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003800.112569-1-sj@kernel.org>
References: <20260909003800.112569-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 08 Sep 2026 17:38:00 -0700 SJ Park <sj@kernel.org> wrote:

> Hi Liew,
> 
> On Wed,  9 Sep 2026 01:50:23 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > qt_exceeds counts how many times the quota of a scheme has exceeded.
> > 
> > The value can confuse users when the effective size quota is zero,
> > because a zero effective size quota does not always mean the quotas are
> > unset.
> > 
> > If the quotas are unset, that is, both ms and bytes are zero and no
> > quota goal is set, qt_exceeds never increases.  But if the user uses
> > the temporal auto-tuning algorithm, the effective size quota becomes
> > zero once the goal is [over-]achieved.  In that case the quotas are
> > still set, so qt_exceeds keeps increasing once per quota reset
> > interval while the goal stays achieved.
> > 
> > Clarify this on the design document.
> 
> Thank you for keep working on this with patience.
> 
> > 
> > Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
> > ---
> > 
> > By the way, I found a thing in the design document that confused me.
> > 
> >     temporal: More straightforward algorithm. Tries to achieve the goal
> >     as fast as possible, using maximum allowed quota, but only for a
> >     temporal short time. ---> When the quota is under-achieved, this
> >     algorithm keeps tuning quota to a maximum allowed one. Once the
> >     quota is [over]-achieved <---, this sets the quota zero. Useful for
> >     deterministic control required environments.
> > 
> > I'm not sure if "goal" was accidentally written as "quota" here.  Would
> > this be better?
> > 
> >     When the goal is under-achieved, this algorithm keeps tuning quota
> >     to a maximum allowed one. Once the goal is [over-]achieved, [...]
> 
> Good eyes!  Yes, seems it was only mistakenly written in the way.  Please feel
> free to send a separate patch or include it into the next version of this
> patch, whatever better for you.

I will send a separate patch.

> 
> > 
> > ---
> >  Documentation/mm/damon/design.rst | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
> > index d036340dae8a..e083b74d618b 100644
> > --- a/Documentation/mm/damon/design.rst
> > +++ b/Documentation/mm/damon/design.rst
> > @@ -863,6 +863,16 @@ scheme's execution.
> >    completely tried to be applied.
> >  - ``max_nr_snapshots``: Upper limit of ``nr_snapshots``.
> >  
> > +``qt_exceeds`` is increased for schemes with set quotas when the quota is found
> > +full at a quota reset interval boundary.  While the quotas are unset,
> > +``qt_exceeds`` never increased.  However, a zero effective size quota does not
> > +always mean the quotas are unset, if the ``temporal`` :ref:`auto-tuning
> > +algorithm <damon_design_damos_quotas_auto_tuning>` is used, the effective size
> > +quota is set to zero once the goal is [over-]achieved.  Since a set quota of
> > +zero effective size is always considered full, ``qt_exceeds`` keeps being
> > +increased once per quota reset interval in that case, until the goal is
> > +under-achieved again.
> > +
> >  "A scheme is tried to be applied to a region" means DAMOS core logic determined
> >  the region is eligible to apply the scheme's :ref:`action
> >  <damon_design_damos_action>`.  The :ref:`access pattern
> 
> I think the clarification is better to be added to the 'temporal' quota tuner,
> since this happens only when it is used.  Maybe the clarification could also be
> shorter.  For example,
> 
> '''
> --- a/Documentation/mm/damon/design.rst
> +++ b/Documentation/mm/damon/design.rst
> @@ -775,7 +775,9 @@ There are two such tuning algorithms that users can select as they need.
>    fast as possible, using maximum allowed quota, but only for a temporal short
>    time.  When the quota is under-achieved, this algorithm keeps tuning quota to
>    a maximum allowed one.  Once the quota is [over]-achieved, this sets the
> -  quota zero.  Useful for deterministic control required environments.
> +  quota zero.  Useful for deterministic control required environments.  Note
> +  that the zero quota is a valid quota, and therefore ``qt_exceeds`` :ref:`stat
> +  <damon_design_damos_stat>` will keep increasing in the case.
> 
>  The goal can be specified with five parameters, namely ``target_metric``,
>  ``target_value``, ``current_value``, ``nid`` and ``path``.  The auto-tuning
> '''
> 
> What do you think, Liew?

I agree that would be better.  Although users might look up the
definition of qt_exceeds first, they are also likely to navigate
directly to the temporal section.

I will clarify at the temporal section in the next revision.

Best regards,
Rui Yan
