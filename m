Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE7E1DF26E
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322663; cv=none; b=bzpkaKPMbBHMYQ2ch/2PXYoBmi6/hJJWHkOLS2W5PkDVxqNsOuZzt4Ievc4UDScxsR4qiX07pbSBv0WOAXBKxgTHZDSWGB6Ozji7QALKomphjQ2g0u5s0eIzdDD002qSq5te5G1Zk7APJh+lGyk+AC4cbsu4B7ygEljEi7fhkJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322663; c=relaxed/simple;
	bh=/Fdy6xvfMQaqxk4Ucfc177UadVLEotfGbvycLsLbU1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkJM9Fdq1JCIja4pZJy2APbBwlRzsZollBAAS2W7MrEV7QZzM6IoGjjmh0q5MB6sUYqGanLWIIS3LGWXnG+AK6j2r3vm0kcefsnZFtfkaBv956O+fLWSKaZbyM85MJI6dPVJLWYtz3yJy3sOxztFAgSlMQRc+DFZKyD8DhAAOEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YzMdj7ep; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pjjI5Zer; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YzMdj7ep";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pjjI5Zer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773322660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BTx/xQB8jpXSOLhkbmx0NoEZlX+Tteed/9B2psizxqc=;
	b=YzMdj7ep/pStZyrMeZqAfnj5W7Ltz6+JzeKgugD4MpcYkI9PsH4mdGq978ASvt3SCRoCe/
	h4eMy/tXnKpwwwvtfbH7LETCk7vGSbVES6e7JiIW+W1eI19G22Z7PZeuSN9hU+0RWk4qTh
	dwxKT0892kb6sq5rJASNcGy2Z3poMBw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-NCI8tDEWMIWiSsRg2JedOQ-1; Thu, 12 Mar 2026 09:37:39 -0400
X-MC-Unique: NCI8tDEWMIWiSsRg2JedOQ-1
X-Mimecast-MFC-AGG-ID: NCI8tDEWMIWiSsRg2JedOQ_1773322658
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4852cf0318dso9556325e9.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 06:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773322658; x=1773927458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BTx/xQB8jpXSOLhkbmx0NoEZlX+Tteed/9B2psizxqc=;
        b=pjjI5ZerSx3/oY13diVX4/2bUZL/YYQLRHjsB7ocshWJi7PHPCqX1RGpNie1pp1+Jj
         DGfJI2/CA4pKDovzsjosWPC/ylO9RGBvQQ2lg4/smwE1f5xyWZ3ksEeuwoqZ9qSkkGBq
         RrAtWh9B+wVWRcNdomlhzop68P8oR1HZ2NkAuhSdELp067LPsXCGvjj7+3Wh+oOPP4f6
         h6JUXVvvf37oNYmaZ3lr8JV7MB2uHQnSgm4RLZOhfb3vYA+gCh1AoT2pSqaHAgXTPsRu
         dYMNE6iWWaDyrU7pkyiBOOL5u4/rjETQKZhJuLa0cbzskt/zKZhpvnbT0JeX9Ya1co1/
         U5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322658; x=1773927458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTx/xQB8jpXSOLhkbmx0NoEZlX+Tteed/9B2psizxqc=;
        b=v3Ln0qOnRBvf0XnHqVhbk6aUNMDkwThbzUWEl1AIb0+leNOyuSu+Z+NmVnKElvwsuV
         +irwLS86jE/Kp3YNg12cUA3fjIqlXF8cGjgHGNiLGsVRCSQmQGrvgHakNOaCLLjjD+s3
         oxlC5vUYgZ9EVncbmTWfQhJJrk+X6QAkbIflxo8fwLzDL7DpXz6vXHIrV8Tn0izAWly8
         uQKR/yOOITfc4KTXkjzPEyCFOISIcWxBmvKGwDK/8do9GT+TNqg5LhhXs86Scur4+rPU
         m4Ru1gk9NOk4kNRGJnwno5dN5fRMbZ1RgGtvwR9VBT4PZlVdT34Ino2fok7kNobvRYfX
         mPDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMxdLdI/IeyVIaSDzdDZcl0ROl6S08fZBCdV7Y2uVNlNH63WsU8ROVvMP6aThZ+uwpK87VWfCfmUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxTSyeoaBMkwjrBYNLyvaBqA9oNP6hi9nCcX3PjCN+LU3CrH9r
	TdQHnM4j0MmlIJ2JFKnTrwuROWj6oaNzJYKP+kt/8oGJtG+0oaXFbVEA8kQI9JKQhZ+H4DjUcnZ
	J/GSwTyHcQWagg1hJSrx0VcWaFPoM3AC1z/oeSgKcoi0toCpZmKNQA/sW8S044Q==
X-Gm-Gg: ATEYQzyr5EOplRxK03cowSxJYvGar3nB7uS1c9+HTCwDNiiEeS/IJ8ffX5gqDeQKPh3
	buIO+54DGOBIi7fIZ8MJ2wm4QCHPiNVOaKnvKnQz/EVrjQtO83HJnkGulYbbPVjswm6CmKxDAxw
	7ZmZl8gfGF+SKCnnL0KGob4hhDZR9b+cGe2CHlhpTItXwWDKx4A2bnMqT+dJrQ4FQ2uceo17d3N
	tiaqEMRt3Op61jCfqycSAYhn9sVuF90KaDljRIEgYsevPLV5Ezf+z6Lo/d59gnj3C2iE4OR3tIR
	+4Z+W7gQSvNEN/3yYCJiHiEIx2DidmznewGi8Opjf9a9SjH8yr0zFc3Bld4BUFVfcMLuj056lIu
	vlaRoJFkIcYtpn6bVYDs5dkiUiFbYwBoX3G5GRM5yYBfaIwaSIW4=
X-Received: by 2002:a05:600c:3106:b0:485:40ed:2d1 with SMTP id 5b1f17b1804b1-4854b0fe8d3mr137010865e9.17.1773322658327;
        Thu, 12 Mar 2026 06:37:38 -0700 (PDT)
X-Received: by 2002:a05:600c:3106:b0:485:40ed:2d1 with SMTP id 5b1f17b1804b1-4854b0fe8d3mr137010285e9.17.1773322657731;
        Thu, 12 Mar 2026 06:37:37 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.82.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b66ffe2sm126229605e9.13.2026.03.12.06.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:37:36 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:37:34 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Nam Cao <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Tomas Glozar <tglozar@redhat.com>,
	Clark Williams <williams@redhat.com>,
	John Kacur <jkacur@redhat.com>
Subject: Re: [PATCH v7 14/15] rv: Add deadline monitors
Message-ID: <abLBnlqIHVPEcisP@jlelli-thinkpadt14gen4.remote.csb>
References: <20260310105627.332044-1-gmonaco@redhat.com>
 <20260310105627.332044-15-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310105627.332044-15-gmonaco@redhat.com>

Hello,

On 10/03/26 11:56, Gabriele Monaco wrote:

...

> +/* Used by other monitors */
> +struct sched_class *rv_ext_sched_class;
> +
> +static int __init register_deadline(void)
> +{
> +	if (IS_ENABLED(CONFIG_SCHED_CLASS_EXT))
> +		rv_ext_sched_class = (void *)kallsyms_lookup_name("ext_sched_class");

Looks like the above look up can fail. I don't actually see how/why if
would fail if things build correctly and EXT tasks are around. But,
theoretically, we could end up with rv_ext_sched_class = NULL ?

...

> +static inline bool task_is_scx_enabled(struct task_struct *tsk)
> +{
> +	return IS_ENABLED(CONFIG_SCHED_CLASS_EXT) &&
> +	       tsk->sched_class == rv_ext_sched_class;
> +}
> +
> +/* Expand id and target as arguments for da functions */
> +#define EXPAND_ID(dl_se, cpu, type) get_entity_id(dl_se, cpu, type), dl_se
> +#define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
> +
> +static inline uint8_t get_server_type(struct task_struct *tsk)
> +{
> +	if (tsk->policy == SCHED_NORMAL || tsk->policy == SCHED_EXT ||
> +	    tsk->policy == SCHED_BATCH || tsk->policy == SCHED_IDLE)
> +		return task_is_scx_enabled(tsk) ? DL_SERVER_EXT : DL_SERVER_FAIR;
> +	return DL_OTHER;
> +}

Considering that, if that happens, get_server_type() will return
DL_SERVER_FAIR for scx tasks as well (possibly confusing monitors?),
shall we add a warn or something just in case. A 'no we don't need that
because it can't happen' works for me, just thought I should still
mention this. :)

Thanks,
Juri

