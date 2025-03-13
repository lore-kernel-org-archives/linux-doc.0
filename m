Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2543F269CED
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 16:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741881967; cv=none; b=rySSJkNT4jmAVFWBXTCZ8N9Ou9c+wvhJPLkq9Kp+dyMkPGAwpiylRgi1XCiAdMs9kvynEXmMnNSiO8SvyWLjLtMIq2ZqItyyLLKriVacD6I/IJr0NXH2vWd2F+yKazJHBT0X+cSYZXnRSfuwuIPzuygNZgWd+6eGSV/J0m2jlHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741881967; c=relaxed/simple;
	bh=9Qz1HoeN3eOou3Eoi4V3CxaJyhSdwyst6GwzX+KW2lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXL93vhQy7RhdRqOfxA43+Wp4D2RDJjBy08RrS+yTWVm3jAKYrr3B6PrRp2VZjmEk7N5jGqWk24bRSM337TBiAh6jepXrjCPo3VdM1dYo3VPdMs9XboJeUbTTuY8vht+aFyxmXX/V9jpq7uZoYykYHsXk92vJSYQRV5Lk+qTfpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RrIcgm0G; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RrIcgm0G"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0782d787so10810885e9.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741881963; x=1742486763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HZvPdaIqRtWzMsbUSWcLTIHwxLYbx+aQlE3dkPDF7Q=;
        b=RrIcgm0GAEoDkeid0sM0ynGRD/6cj50mS4il9bx/pzyblnCwK806eD0kv+c8fLNFyb
         jmSIdIYOfAsMRe32uOEx/YNmVaToedT4uFMX1Gaw0p+znMf7L6XAD8D2z55bCCz+0gD8
         9tsJkpgk0rWpNYFHtjC5ydrXFNnE9dSwdrOjDdR5UpMPE0uhj5pKfUFScZ6e1ktu9Ixb
         So+I262nCDnip4iyhyGHp4ojQJIlsVmivsMhnD06CwNJx2XYBUFsQRVzOhfdpKTifQW0
         RGDJ3aXudlvw1fGiJ5QIp++82KgNISagfIbv7PoTKc5tWnk6yJHAXZco63UYyMGfEKJJ
         QGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741881963; x=1742486763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HZvPdaIqRtWzMsbUSWcLTIHwxLYbx+aQlE3dkPDF7Q=;
        b=of2cuLKqDfAJZhdncCrr5ucBvR4D5Vbe1/kT3dzNeViUYQWydK3df+VEBON29TpP+A
         KVc2nUPlMJ00S39qnRHAD1FRSDVnGMtyo8tHv/eMuqAZXRCYuO4H7ujIr4f9DOqRYuPn
         VBURFkPbpWCGj4Iz4OKy/li1NECm9wQMkb0Y+bA0ys1BFCoOXJZVRCOBmgEzuUnfHa1v
         k7vjzlv05Dh/f2VMgWKdbtn71YoZj62gyY4oSGc5rlCMn9azRYS2r/5pK2hhngji19il
         BVrWwR/Teybktcepvir9RY0AH29qG4II8EV/sMYCNwVSTLUZFOrfo+lAgRP96N9dL3T3
         crUw==
X-Forwarded-Encrypted: i=1; AJvYcCV+hT3NtHTekx6K76SDAOP9pIX3PoIToxO5JKey7dhlSRA2v38YPxQ90igxe0sqdS9c0LsSGGImyhU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/OnJnJPRhIEnEKwGGOdbU1J70wP0H+6M3mbYIOgG3bI3FrUO
	WoxkqipOcSp90aIAXf9UDrqCYYvTD8Pr5Gzl1BcutY/XfO9utG1MWdfIuIaI9QY=
X-Gm-Gg: ASbGncvO1271tmzqy0U58Idphi/qL78GsKV2qQFBBbUDvNyE7R/NK1QVrU3YTQn2lb3
	XhFOfMVnsFmH41Jj/UH/MDo7VSLVUl4VESJNuh5TlqaBvFsVPvpbAgDctShCpDtCEkXsq3nwChN
	hGX2tkwXRzAv+V0vKdCwoeTBRIbCrFwqX1UtKztn8DxTQE3ChZDRlWsjOaEI7U26+1gXCqaDZmN
	OpOc+OiA5W+d+s+IKSCg86mfZ5syX6364O9rVOR2YV2N17eqKpwci+CINumTyqBmrrmXrR5chUT
	tWc7VYma5OA21blD6zFy7C1UwJ9Zy2JbLNFPsozd43hVn3l318/q/8YE1A==
X-Google-Smtp-Source: AGHT+IEQgvgSedwxIKGl9SiZ4df69QimUI+L/qJr9u7Y58J1gpKQcf9TTsptlOEMUHLXVau4Wsbqng==
X-Received: by 2002:a05:600c:1f81:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-43d1d8cb061mr1985145e9.17.1741881963106;
        Thu, 13 Mar 2025 09:06:03 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a74cdedsm60150725e9.11.2025.03.13.09.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 09:06:02 -0700 (PDT)
Date: Thu, 13 Mar 2025 17:06:00 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: [PATCH v6 0/3] printf: convert self-test to KUnit
Message-ID: <Z9MCaPagUM7KC26x@pathway.suse.cz>
References: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>

On Fri 2025-03-07 17:08:55, Tamir Duberstein wrote:
> This is one of just 3 remaining "Test Module" kselftests (the others
> being bitmap and scanf), the rest having been converted to KUnit.
> 
> I tested this using:
> 
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf
> 
> I have also sent out a series converting scanf[0].
> 
> Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

For the entire patchset:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
