Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB2831E10D
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758830779; cv=none; b=qjJ+VvqPWLxLACTGCgEnijvnpb+vd/pUIKWmAlQgpYH10dGtTsQOzE44Kv8jNAWzzcMqNh1b2oC8GF/9xFkh74fx514y8OmuOOurppCxuYEkvBt7E2oDnQ8biAhVvJbmn64P8uqJ6IF8+JRF7M0E3X1EHY3H2j9tPaNLSHqVBl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758830779; c=relaxed/simple;
	bh=Xx1KeRMb8qASSXQQi6oPfzSHjtino2Erc6qXBCGf8kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsP1Rj5nbxI8fqD+T+UPZ9QH/Q5V0o+ZF501jcO5dHFMdbCRUTW67sfZx2r0pXh1GCTUispgBvoAylPlHZ58V7fg4pqi51hOfF125NlVRi4CmSQjhWu0YQI4I41LGRzkJS4FSdnoxJ78VdY8QZJOlsA2UdN4lzaGHqQLmTB1NcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q0hnIkrV; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q0hnIkrV"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-424d3c1256fso8477275ab.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 13:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758830775; x=1759435575; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZ4J+q8Jl9uXHJWsnYE6h3kFUoOp3/nCTgLQNbxMPJA=;
        b=Q0hnIkrV6h3MtwHvFdc6EgugqVJ0mjjALtcl+To9m9yTQZwpcsBmoI6j66jQY75sAB
         w3VVp8KAAhQIIqIXhAZcpFmAO3dUJQJlzHMDOz4asW4BPBvfYLyGqS62b1VYT4WHuqaD
         daEIAv1Fs84+IJL3zu/FcnzWglxJPMIGDXMeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758830775; x=1759435575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZ4J+q8Jl9uXHJWsnYE6h3kFUoOp3/nCTgLQNbxMPJA=;
        b=O5JxTBAENdToBUhohA1aoqhboipqXBklOrU5JFg3gK392G/9wkOPcpCS1Yr6kDEs5h
         Lyhub5R60IcK9DrqfFfC509eldis4+MajFXvajNlUFF5Re7TfBWNpFpLfq6+w+HwiquR
         IIRn3/sn+wGKjG9+6i6Rfz8zXtVtM2PbuYE02UKvKq5l5r7onfob0vmN9BkNG7vVylgx
         3QaWj6RJ54/eAFW+DSJoqSTm2FBKMrow68sr83xLinZfoEexhfK5DUv2YPA6ZAdScX2O
         vf8UYl1/1jFZewi7ts+FQFylAG2zWzetGTebHFKVGAN585XV0mhErqQRJue91qomakAe
         1NrQ==
X-Gm-Message-State: AOJu0YyHO7jmEF8PazqinxoJP1lQ6I4uqUoJ1UEBaEunug7Rzonkma+g
	yeBPFYNdgD3eGtYToiUDjdo9fRImZ0FRmTjyPE/b4YIoSChx38gGcf7+3rbAVLBxfnA=
X-Gm-Gg: ASbGncu+piD2wCy7tVBKZlXNaU3QZkeClZ13TcFg2w51ySLSdBO+iCUcyUSq3G2pqCT
	ZBpR/hNLNvcv7avQi48438dM3af7SdAvoFVTSFpj1jmA7OUMKdBCnF3P2g+3a5Y4YB9EjfIBuyY
	NggPODBKBobL4vlKDaYsqFJ3yctIrm4qOjRsvw5RQfiI+Q/uM9vnIOPYRN9SxuuXkqFQulWQgot
	ZbTokuYDNCeuWcJJCZtRduRgRDKujzlk15Mq/B7Dh11e81CPQjw1gG/j+trYSXr60nZmRCVQ73O
	SnlcMTX5E4MKJZsvKWx/cryZn8hBiHvcQNasSx3qd4HPtisOK86zvi3O+RF9T9b5xcquscR0F4U
	UqIhcSdVtcVV7S9rJQUpbx3cKVPO0sS0zfss=
X-Google-Smtp-Source: AGHT+IGgoqo4FexGR81T+2V+UyC7F009+mx6SQ2pBJCOPIpWzVqCjsnAHekbeNq05hlbCiQ/ymxj7A==
X-Received: by 2002:a05:6e02:441a:20b0:427:5aa:4570 with SMTP id e9e14a558f8ab-42705aa4687mr13249845ab.3.1758830775392;
        Thu, 25 Sep 2025 13:06:15 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a648d1aeesm1082556173.8.2025.09.25.13.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 13:06:14 -0700 (PDT)
Message-ID: <650a4711-1d33-4582-be84-19ab99ff7f82@linuxfoundation.org>
Date: Thu, 25 Sep 2025 14:06:14 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: perf: cleanup fujitsu_uncore_pmu.rst and fix
 htmldocs warnings/errors
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, corbet@lwn.net,
 fj2767dz@fujitsu.com, will@kernel.org, yangyicong@hisilicon.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250925195442.71997-1-krishnagopi487@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250925195442.71997-1-krishnagopi487@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/25 13:54, Gopi Krishna Menon wrote:
> - Adjust spacing around list and sections for better readability.
> - Use definition lists for defining events.
> - Replace block quotes with code blocks where appropriate.

The bullet list type format used above isn't right format for
change log. Refer to a few change logs and also check submitting
patches documentation.

Sounds like you are combining formatting changes and warning
fixes. These are better done as separate patches.
> 
> Fixes the following htmldocs errors/warnings:
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:20: ERROR: Unexpected indentation.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:23: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:28: ERROR: Unexpected indentation.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:81: ERROR: Unexpected indentation.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:82: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> ---
>   .../admin-guide/perf/fujitsu_uncore_pmu.rst   | 130 ++++++++++++------
>   1 file changed, 87 insertions(+), 43 deletions(-)
> 

thanks,
-- Shuah
