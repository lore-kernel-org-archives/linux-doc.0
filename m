Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F2D42AB4
	for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 10:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726049511; cv=none; b=SghaAfOxl4izNvBvWpzG3hvBRp+7d+53j/5ODaUU6wAl8yPqDIujTeH4yznLGFksgUdiBlBhhgunxcbvfZSUrOL8+uhmPsHOhwXsD1cIoosCVOxzvlZO1GFWDXDQ79OA/iPemx7bQX7Sr4IQq5wychJrUnnOXE5YyNrshFnLkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726049511; c=relaxed/simple;
	bh=ftolDcfUkmZiCTLysXwSzcyxUAPWD9IbC8CYS71P27s=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=o1oHfUZqMWXaK4ZRvgE06OOs2/c2cTKykP6qHUUmHiCBaFtsLkThZl/sV4zLdjm8mOxECbqcjGZXR3pB0XRBzq9rEJ4Vn02EvddYhS5WxyuD9UHP1Z5xgzy5mfjxhqpWm91j1a42Dpp8TdlFf2D9NlMYzC2DCTIGzMltL0E//t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeyJZS0f; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeyJZS0f"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-656d8b346d2so4205395a12.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 03:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726049510; x=1726654310; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GJmhaxcD2ZpXU/6bdByFS72tpXBtW6cTZhtT9SXRiM=;
        b=NeyJZS0fTeaNo0C+C2MsbC/3PCKkFVkgqQqrEkzQX15GQYdqdR7Gtz+RrvDvlTRbRs
         7l38H15w7TjAU9CS2zw/4iBnqXV52LnxeOjeqmlEz6rk88g4ouLnQPYCUfejcvpDvEYp
         4YA5hJZv5fD0vxNxAtlBVnOOs6wuCsBgKqvEc27+mgGUgIFH1ZT47w/11aaqviJP4y8G
         jgw8qADyvW6nU8Qi3uhDoosYKQodlhq/2L/DLCn/C/rloO8IyljERpUjQPvVFsx5klvm
         U1R7rl7RaA+lA1NDFGV8pB0x3dl4dhr0VmdFQVizIDxJ5Y9ZJLWZYaFkgITp6bYxigyF
         dz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049510; x=1726654310;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0GJmhaxcD2ZpXU/6bdByFS72tpXBtW6cTZhtT9SXRiM=;
        b=p2BQrzOQuaLPSH1coJvHBYVRSmCpymEdUFA+UuN+Su3kZgOQxQUK9spgarDyce5Ril
         A1hBJvzVLJxkUrNH8VeIKEZUgdRAM30nMu8Of4x/+0mC745McVwLZYij0FPZg/a9HnLX
         rLttZ+TyzgZdgwM6MHr7otXiKLikvGOpmvMVhWNeCq92THcR9oIC214UrzWeerZQ2/T9
         Lh/TRKwAJKhdXOvufGP3ZvEoNWbCzyvuT1Q1+FhuEqrHtVXp1vriZ2R6e1n9C9ITe+wA
         3lWG19C9z/x+1AJM8pYwh6dEWcj/88DuGlTge+iXiI+RywCIX2+A48sFHSKIX40pw/nL
         B2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXFPSnEi5oU1OmSog/+qZoL+NMfcLfl/OMSXx2bMPsw3UA1J8sgOcC/prbE02ttCd53i5lP87jXM+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM5idB4zxyZCbYcGjh7Kvrxd1OV0Klj8sg7jqDh13TdqvRrImQ
	z7s4yuYt1WNHPpDJ0k5vgdUPUxPFrU36EZYy5XaYjhQtx1QAO5hnLIszfg==
X-Google-Smtp-Source: AGHT+IGMEkn8r5+lTCXXs0fdzSiEh3unFsVffie3NQAQB14k9/EQ5EOHC6NxHLHHeHcL6nQ+xn6U4g==
X-Received: by 2002:a05:6a21:3318:b0:1cc:e4a9:9138 with SMTP id adf61e73a8af0-1cf5e10ea44mr4896729637.29.1726049509282;
        Wed, 11 Sep 2024 03:11:49 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090951basm2746433b3a.97.2024.09.11.03.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 03:11:48 -0700 (PDT)
Message-ID: <75028548-2c1b-4ffd-91e5-9f3ae72d9c3e@gmail.com>
Date: Wed, 11 Sep 2024 18:11:46 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dongliang Mu <dzm91@hust.edu.cn>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
From: Alex Shi <seakeel@gmail.com>
Subject: original file finding
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dongliang:

In scripts/checktransupdate.py, 
def get_origin_path(file_path):
    paths = file_path.split("/")
    tidx = paths.index("translations")
    opaths = paths[:tidx]
    opaths += paths[tidx + 2 :]
    return "/".join(opaths)

It use a different way instead of the ':Original:' line to find out the origin file.
That may cause file finding failed if we have a different dir map for translation.

Yes, we have no worry since all of them are same. But could we take the ':Original:' usage for a possible dir map changes?

Anyway, just a quick idea.

Thanks
Alex
