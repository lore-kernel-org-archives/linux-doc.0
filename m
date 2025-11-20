Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FF819B5B1
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 01:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763600917; cv=none; b=szNBCGe8WAcBKWDTriRLjnY6hcbSo0ZdkQ2RtzuP74Mlt7lxmRrY4m01M5RrujaQroBXegpGAPyjgmmCaVJhirJfZROBOQnutitxIEGrjG04m4JQI3v5D7Um+sPBBimHlS27gToAjebEL6t9s3b2DRcZcu5tEZfK3NYJkGWQfjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763600917; c=relaxed/simple;
	bh=tmEpJf1Nw5yPSy9Vk3Hdd/9k7oMV68AlZssalQaEwJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bNselLMNYySQJs8mlAsI4j3lb3JVUfKDBj/82J8HBhu4DN7/szlv71ai+LQ3F4jxpWmCvhZ/F09tQ0/7IvcD1qxpzPG7rgtRPxRvQ87QAttNDGNZslPMCu1ChnnnK0M6V3tiepk/rHEDRocN0YfQLGpmnfN/fP16QLTVq2M/NWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VM91XL6r; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VM91XL6r"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88246676008so2875246d6.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 17:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763600915; x=1764205715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmEpJf1Nw5yPSy9Vk3Hdd/9k7oMV68AlZssalQaEwJk=;
        b=VM91XL6r0AF0wwSbdg50pPByRuZNMbcbJ3nyjHtUKiX1jcKh7uZKmYo7yVmgHgleKP
         aWgq4qr/KjDkhvf7rYi94ArMa+ujjJWxGXvZt/DAtCqZkeqvA11hRQCNumsMgie+VDvY
         l2h1S90f2A/6YcO+vxARmLWDcTEpcP1D7ggb4WypVHJhWToEgCTWf6DZVDkcWRqY3aXe
         ZP4+s1V4CAuj6yjA6VoM0yOQ3Ja6A4nuFBwrav7pFwYdc9MkP0FgYByGwgZjJN+wAgNW
         fKN/hBhgJhYeegM23QAbx+PwwyhL6WYRoN5tPqdECaGxXLDr92NeaPOPVWgqGVTdpCja
         f3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763600915; x=1764205715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tmEpJf1Nw5yPSy9Vk3Hdd/9k7oMV68AlZssalQaEwJk=;
        b=eqw38J0mCrLJ2paBhQorNq23vB+2pLM86LGgsiOgCdvvrldelYFk3JmGdkv2SMKNVF
         UBYAT3IsX2aYn0r2JgkYZvwfEuhj9KphW4CPXpmm5QMO5vb9fbk4wVOav1UjfEokSvY6
         sCpCmSlKQSANHXhX6mABVQ/bGx6yce1R4uwBOsmz06PdDCBYDURg6EfowxblWE09gW84
         EyM9yEUNqdC/m52Yl2s0AzYIL9JbpOiATZ8Mu/WFztC2/h28zIreI/tVPmNpZ11aq9bz
         Rc7cno3lvou+7xkENn2BfSC8eVFBMpgCXyziaAOmpp2E8YdlRyq3GcsinIYXtIL5bKzZ
         mvag==
X-Gm-Message-State: AOJu0Yw3yY77fHXSNnIa3z7m9hwpB2Fvxk0cGKSEtSmESxb5q544G+7K
	t79K859U2P43FJOdZ/mvKUhqXpfkZS2I35lP141urWvrBs+rr4n4f72w
X-Gm-Gg: ASbGncuMZUKY3GaCm9G5UCSTEAegHH8igSQYBcXKgIV7oH+DBdg9bTvjJhYfuvHY8nh
	fP8RHfE945YfOEA4rk3wNexjLy2wH+SqhkIR4t+ybaMAqGK2jHeli1FpEoFFR+RPKtvw6ofp/v3
	IfV+Nx/ppeE69CjCw3iFbKcFYRzrDShcV/GgL7gQbmcYKICrYt2kxNoxMT8J3aD18FDlLG1J4Ws
	qWxwDjmWrTYuh3wvY9au5pFc/DyUXhCHrxHWtYL+loQnHn7g5VXAt762nhLkhdqs/7jSPErzYb1
	QT/1xtSbHnTV0a3OxnJv5s+Z94DYlyKm2JgU/ilXhMQCtb/e+TJaG0UHX30zjutXX8uIpyUlfDr
	qmUID1tS1Sply/qfw96fPsMYzvXGHcYVOj8tc11xiylv5m6EReXu/TjFR8Q+8k75/tNpGdfhQ+8
	yXDZ9NwDLzF1VPanXSH48dEnsysj8HctlNhdM7rgDNqsUYBebRoqpbTg==
X-Google-Smtp-Source: AGHT+IHxLJjPkr0q/ctV4Sqs9C5Aj1+itghWVfgFWbdzUquqg3G1wsuVejVy/OY8BvFJOBiSEvBqNA==
X-Received: by 2002:ad4:5ae9:0:b0:880:4219:62c1 with SMTP id 6a1803df08f44-8846edc017dmr13291166d6.15.1763600914590;
        Wed, 19 Nov 2025 17:08:34 -0800 (PST)
Received: from daniel-desktop3.localnet ([204.48.92.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e469825sm6999396d6.15.2025.11.19.17.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 17:08:34 -0800 (PST)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-doc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH] Documentation/protection-keys: Mark as available on AMD
Date: Wed, 19 Nov 2025 20:08:32 -0500
Message-ID: <2169582.ukoFCf946E@daniel-desktop3>
In-Reply-To: <20251119215038.GHaR47rlpLKZlu-m0y@fat_crate.local>
References:
 <3647894.L58v44csPz@daniel-desktop3>
 <20251119215038.GHaR47rlpLKZlu-m0y@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Wednesday, 19 November 2025, 16:50:38 EST Borislav Petkov <bp@alien8.de> wrote:
> 55898 for Zen3

Added mention.

> 56176 for Zen2

I was unable to locate that document. AMD's website had redirects, and
linkrot affected wikichip.org and github.com/amd/amd_energy. I'll just
leave it out.


