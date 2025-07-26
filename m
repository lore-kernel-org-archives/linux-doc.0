Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F4520A5F3
	for <linux-doc@vger.kernel.org>; Sat, 26 Jul 2025 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753515288; cv=none; b=faouTGiXE6WAbr4rBtRXDKT8Rnz1CBe9W8azcFtBZnBg/s/vTpUq2eAmMDPb1zhab0ZK7aorEwcpV6PkskuYRF2tRSfpmlxBXtc41udPLwjL4Zl2x2DNGt7U1slYGeJMwZ8sSB4gPNkseN+O/U4NUqOErFMnHz1Z27k01Jlfct0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753515288; c=relaxed/simple;
	bh=FMNmStjOUWVtt7cOwV8Qlv+tumSg3tiV3l++SO5dGx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNf79nGesxUxuPLEjyC1Vp4D5sWl6kyuwbxDbiOqpEGuFGwaYD7YLd3qR1aKtccbJYJB3BgkI67lkeaHzQa9KcmqrRXhuN+9AOjaGzL/x/HVxS9KlS82hHOpaUrAfGmgvtXlgB+T7t2pvY3cOuXtlV1btc9hcGU+dy1h862Cagw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=khI36g8W; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="khI36g8W"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b779a53fe7so152874f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 26 Jul 2025 00:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753515283; x=1754120083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMNmStjOUWVtt7cOwV8Qlv+tumSg3tiV3l++SO5dGx4=;
        b=khI36g8WBD5L5T58SbErP3gsvmWIvDAjpf/72tHfCOG+ZWf8GUkTHOIxZ/yP1k9mg4
         1bG9x1mQOcsv6SKbEVWOn2dt71k3a5+Aax43Wts+R73VAviGHQ7SXLF1h6gqwa8VfBvJ
         V4OpcUUxMQ/o6ZhN3FeZWix7X9LJ7nxL6mrBVZ48OhCWwS1f89ZCV0raWbW53QbwEWUX
         Bg+wxxlFMdZyczs8JFXFR8Y0gm2I7JVhM/fe3866H4qC7Cst6jGqSQg52I4PIt5P6XOK
         XnznRJfbtV30s6EjYxnx0v16twlEvT9tGgGrkvAL+rUnBeFrPkopntpaUuGuWlTsj/Sp
         Ea4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753515283; x=1754120083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMNmStjOUWVtt7cOwV8Qlv+tumSg3tiV3l++SO5dGx4=;
        b=LB/HAP6VFrkqSxK3t1EToVV74XMpvk1r7PJccM/Er2HIrDorZOU20G1fGOp59eMVHU
         YDVod1McELhNNMHt8RuJrKG2QL06ptbEmTPBUutUgNl7+SOrYssirflr7RUHLuLfnp8P
         rltblJWkN/HdElppbrTDQ8kZOWG41B2lrpiTcnnCxAC6lNqNJc3G/crxePg5eWahLYcm
         mwJCwcq3WE0GqTVeWDWrdIq7tUyi5KNJ/vq1xVezcONX373iRukLoF4pcNY2W15Ya2BH
         2/qgh2sYeGTRL51GR7ni7lMOT9W5aeYDZHutUpDL9RPRWQ/vVQv4oUaSGGPTESQ/Ggs8
         f24w==
X-Forwarded-Encrypted: i=1; AJvYcCU0VwM5O5pAMgz6AbiXAtWyjs+V5N1cgjtGsD7WlJ7qltJypUTtPlMI+/WZu++Akjj0beLbWUEda5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoDLX8ByJH7VhAxlSLcbATukQFaz6UBK4lwDTTcuCg64jhVq1b
	l/ANX7wnflZG7y8NC2g6vuMRlV1wTCSj6YpX4YlyHNBw0VYEmFHtJY1CTy6nubjmty8=
X-Gm-Gg: ASbGncsD8+nN9bj8gTQ6wx6DR7/bnMVGVEAsc+nZP3fKyD/CXBm6Vi++tB4OXaXwpeK
	LTrx0FPNKLlZvJ5b9Qh5YDUvsr7BDUihjn/88nD2fY6GIK4tvFvjLNnWEbKJLic/KSrLLspGEaF
	BbE7+gxm2Xp4ZCZUGdK3gdX5s6gzMpIZiGrLHQBLlvB4v/QDWWQIqpVmsuGdFOUedZYziV9g3BX
	meRLiKsNjPcmFHoUOod5aGFBvkBaiLroxMlgKbOwT58c7FjEpJronaQBPXSGN7uNNJmpCGYfFsY
	+/TQ8n/kWI9cDaCs8hxuaJcyJEShpaeT+Q6ppsrqRoSyi0B+b12N8CuvSO7RdYRuNJyksDnkKie
	Cn3r2eoYExjcNEc/0ETrPYsOIRnubkrKDn/ZRz3wxaT18DQ7u/TUL9v4Y2+xv6ENNAqfNPr788Q
	i92fJ+9GCc148G6SaeqAho
X-Google-Smtp-Source: AGHT+IGS1R1BLd51LhebYLPR71ELpRpxxT4MPtlRkigqh7295cnHvdHNyjtNpQNmAZYcVC1/uPyNUw==
X-Received: by 2002:a5d:588e:0:b0:3a4:d9fa:f1ed with SMTP id ffacd0b85a97d-3b776728f9dmr3020420f8f.13.1753515283332;
        Sat, 26 Jul 2025 00:34:43 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:aad:4a11:7705:31c4? ([2a02:1807:2a00:3400:aad:4a11:7705:31c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f1e760sm1991506f8f.69.2025.07.26.00.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jul 2025 00:34:42 -0700 (PDT)
Message-ID: <bbe1ea08-23bf-43dc-960d-bb8a214b65fa@hammernet.be>
Date: Sat, 26 Jul 2025 09:34:41 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: validate commit tag ordering
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com,
 corbet@lwn.net, apw@canonical.com
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeff.johnson@oss.qualcomm.com,
 akiyks@gmail.com, konstantin@linuxfoundation.org, krzk@kernel.org
References: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/24/25 09:20, Hendrik Hamerlinck wrote:
> Modified the checkpatch script to ensure that commit tags (e.g.,
> Signed-off-by, Reviewed-by, Acked-by, Tested-by, etc.) appear in the
> correct order according to kernel conventions [1].
Hello all,

Thank you for the feedback. I wasn’t aware that the tag ordering
conventions used in the TIP tree are not universally followed across all
kernel subsystems.

My motivation for this change came from a recent mistake I made in a patch
submission, where I incorrectly placed a Fixes: tag after the
Signed-off-by: line. I realized that checkpatch.pl didn’t flag this, and I
thought a warning might be helpful, especially for newer contributors like
myself.

I now realize that my approach is too strict by trying to enforce an order
for all tags. However, I still believe that a targeted warning could be
useful. Another mentee I work with recently made the same mistake, so it
may be a common pitfall.

Is there a general consensus on placing the first Fixes: tag at the start
of the tag sequence? If so, a warning might be helpful for newer
contributors?

I was still using checkpatch as that was how I initially learned it. I'll
definitely look into using b4 as well.

Kind regards,
Hendrik

