Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C091429E0FD
	for <linux-doc@vger.kernel.org>; Sun, 17 Aug 2025 17:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450258; cv=none; b=cht36pinio8uRFM77ZX5BpqIdT9/TPZV/jB6r7eBps4ElT7Kfc45DlVX8acc3V8ow6g6qOAxB2ipvhwwGNKNjTA5N6zgdbRnzBXWVbiys5x7W9K+6k1LUMqmuPHSNzPxdGVGNj9jVD7L87LH0DHZNS7RXI7xlIBElDTJefwK96o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450258; c=relaxed/simple;
	bh=yMiSu8+CwATNqA0jqeNPP2G+Vuy2X0Hp59x65+/AEpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZPfrhj/PyvNnaGnG5xnsebfvTzEQ2TTcTI/mUpADUc6mvaC8UDUsW3+KoloMdUfhY1xlhNdqKkip5y50YIt1M0NvnRlBsdRYaCHmfschXC/6N7aJlvtcKtBm7wQoRjb9rQNX/rjDNSnO75d367Q+qkp09nA+34Sa6p2ee4QhJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=HWtQ7fLK; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="HWtQ7fLK"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e8706491ecso524126085a.2
        for <linux-doc@vger.kernel.org>; Sun, 17 Aug 2025 10:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1755450253; x=1756055053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LTY1FVq5WoDfZQCECYiNgPIc5/Dv8Hx0SVT+yGcGAKw=;
        b=HWtQ7fLK2pfzdh7dFNWX0qRnmOqs5UQ5tHjj2rtKAVB8tULv+uOXfGAow1SjyQRTtQ
         DNOnAShbzAeMYeOhqEswwtL70eNgE++dLWpTQ5pAuIPoZ4RDUUvAvhAsdg6nBrWe7L/C
         LvAieKlSgeeMiD8g4hmo80kvhq/ML5K1rJrWF9nUvFMuKdrlEacYsNSa28bdVbK8d2R7
         YR489yWUDmP9ovQnZ7y7Pp0H+tG7GtF60COHQeGUanikM7Ki9yCTCx1iPhSaADiEea4M
         2JW/oD6ArlpMQdPUz3a0ebIacpjCeWAj8U7lBgzNoQOOD9jp/1DxFYVveupINjnZySND
         bILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755450253; x=1756055053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTY1FVq5WoDfZQCECYiNgPIc5/Dv8Hx0SVT+yGcGAKw=;
        b=sXa/R1ZuzfRVazsSXefeWhoM3rHLVNcLjn+96uN5i8anJmiVNTs+4y6+MGkLF6qsF0
         jbGktNA8o8sSuPQoQ5x2KUZ4C9xDTO09nhbsoxyj82wtn4HCj+ZCjNmUIOH1T9yyqXsO
         v8tZ+Pcombe4+mLmt8QNI+DPD4rli2XkG8yOi12o+ta22QDQynsuZaoDSZIO9ewjiA0h
         wjQy2RWIItJYuBObzRf5x+97IPfaavnmaG1JKDKv2fAnZrvsY8VTmJKz02qtwuAi2Paw
         mgQm6R/TSEtR6pfenbN3xzUnCnVCPe8Xa0uoT300LXaL6J+LKuD25v3x1OGKs35wNTJ7
         IMew==
X-Gm-Message-State: AOJu0Yx1ZFl4peOtLGDSzH25hkBdC2KJG0zXApon9ZeV+m+2bb4VLNnD
	NfUApELrDcKodAHoMZBSlLa68i5wEfjW5XwV+BZFeQQytSI/7fAve8jQSiwayuu4mTg=
X-Gm-Gg: ASbGnctyaoFfbQU/580+Q+RGNkwYKl8/9u11SH8DQU8knNIihVkMpXLOY/+BmvR3/i0
	WhKJmBWXTKpV3QL17f8fNG/0N6r1jEwo5AJ1Aajs0qmbCCw4VJr4OskT2J91D+UFRpVZfU3BrOw
	F6y2tiyKLSyYccmXAX9l+q4omEW8tmlZjNWHZYREwXSpm2ljMOzwem42dEPa3u2kOpg/L2VXWcp
	/ZyMCwhilvkpv0pHLEyD4avSc0kM/eKWWECjT7j6xJhA0dKWFBi18gK7nmbuC4/+PaZuN5+5noY
	c/bfmIk5zhd8ycbmCzYQBxpXNRovuFJ5KvYAbs9BTsaopws58UPnByDSxWc71o4MrfAxvld0c2X
	vIEIXkpnpULRyzv7Ix9F96VyL5W6cuwm7OddXf2bF/q6LizlLMCR3VBrH
X-Google-Smtp-Source: AGHT+IHx+kOBv3NDxYTEUEXjNrbq1sQssAeYaYPTpf57jYhOiKKX1UR6U/rAq+fbGEMsJYFLovCD6Q==
X-Received: by 2002:a05:622a:5445:b0:4af:7eb:f4a0 with SMTP id d75a77b69052e-4b1336ee522mr38590451cf.19.1755450253523;
        Sun, 17 Aug 2025 10:04:13 -0700 (PDT)
Received: from fedora (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dddb0e9sm39210241cf.32.2025.08.17.10.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 10:04:12 -0700 (PDT)
Date: Sun, 17 Aug 2025 13:04:10 -0400
From: Gregory Price <gourry@gourry.net>
To: rakuram <rakuram.e96@gmail.com>
Cc: linux-doc@vger.kernel.org, dan.j.williams@intel.com, dave@stgolabs.net,
	dave.jiang@intel.com, jonathan.cameron@huawei.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	linux-cxl@vger.kernel.org, alison.schofield@intel.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org, corbet@lwn.net
Subject: Re: [PATCH] Documentation/driver-api: Fix typo error in cxl
Message-ID: <aKILiuYaijqAZvPR@fedora>
References: <20250816183034.7970-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816183034.7970-1-rakuram.e96@gmail.com>

On Sun, Aug 17, 2025 at 12:00:33AM +0530, rakuram wrote:
> diff --git a/Documentation/driver-api/cxl/allocation/page-allocator.rst b/Documentation/driver-api/cxl/allocation/page-allocator.rst
> index 7b8fe1b8d5bb..4ac3368c3947 100644
> --- a/Documentation/driver-api/cxl/allocation/page-allocator.rst
> +++ b/Documentation/driver-api/cxl/allocation/page-allocator.rst
> @@ -62,7 +62,7 @@ Because the local node does not have :code:`ZONE_MOVABLE`, the CXL node is
>  functionally unreachable for direct allocation.  As a result, the only way
>  for CXL capacity to be used is via `demotion` in the reclaim path.
>  
> -This configuration also means that if the DRAM ndoe has :code:`ZONE_MOVABLE`
> +This configuration also means that if the DRAM node has :code:`ZONE_MOVABLE`
>  capacity - when that capacity is depleted, the page allocator will actually
>  prefer CXL :code:`ZONE_MOVABLE` pages over DRAM :code:`ZONE_NORMAL` pages.
>

I have since discovered that this area of documentation is incorrect,
and this behavior is the result of bad reclaim logic.  I will rewrite
this area shortly.


Just drop the page-allocator.rst chunk please.

Reviewed-by: Gregory Price <gourry@gourry.net>

~Gregory
