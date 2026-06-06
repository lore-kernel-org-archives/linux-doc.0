Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD85B36F42A
	for <linux-doc@vger.kernel.org>; Sat,  6 Jun 2026 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780741231; cv=none; b=NocQ3RVMdn0UJ+bwmMyplljm0xXzC6m078b4Xla1dxPJbOV15Q+jr7xD+ec5UEp4bVzTJTBAvbDHXSWcbbdVSDO+aCaqYc9rEo/u70KEKc6ZDjA1VJzX0NRkft54BwQ9165+7tg77MU+JEuAlGRTUcvqW3Ju6ENPaPQzNkxOUTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780741231; c=relaxed/simple;
	bh=uDx8Zj6uGPOLysfp+I7cIZoDxmiFQufsnPmzXBN15a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtEOJU9f0L7sBHWseN8qj+6wE+rCNXyN89nOZCDq2NFLa4ZqGTRWIuS7U5EShbcAmhHAgDzIqxUsZ4rloo2TWr61Nb3VrDn6WOrLjpwlFELLIKgFNzIOogUZuV3RrcPruXqwKUDauM7s0aFtUOcMA3r2PKJ2DxZdS9Qvy6+KQug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tJdnqy+M; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tJdnqy+M"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137ff9a7d5eso16845c88.1
        for <linux-doc@vger.kernel.org>; Sat, 06 Jun 2026 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780741230; x=1781346030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rI4D0m/tct5A6mLgdnGzeGFfOZi2MuVNzAsWtboD2FA=;
        b=tJdnqy+MQHROu7CxISL0KDLhnx5fEKamGfK+HKpMFyTFDwmNJJcWtAhfH5M5i8s3j6
         tvck2idsr62FGfisGBCjyq1qHqQYiyWDO4C0GQie+t1eK3jUtrdQqQmnreQxAqrUU0ZC
         53bgy+6jomDBLrxhz4L3r1/0dUb0ZK+5OzjvkAR1x5IGw+PlJnbyCV1htjhDbgJu4rq2
         oY57oEoDKDRh3Czki4/iH9ySieMBQ1n49jAt0+rwPjRglHnK5HdhMEhckRWLoQJOAIK0
         G9QpVw8IltGN3JQ2pqk8PZAZoUwfUDlt6dn9+rWsUBP7DIMIqbpZkRUUwCcCRV8J/X85
         QIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780741230; x=1781346030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rI4D0m/tct5A6mLgdnGzeGFfOZi2MuVNzAsWtboD2FA=;
        b=LCAPHpKarj7BQXPwohruxNsjOIVcBx9RMGLCPTPYheI7ImyofWWOEvLdcwgVEgsbXv
         m1aILGewLOV54R70xoCUWfSTr6if6ptUbT+N4Bq2kMs7q4PVyFvR3s/gqOf+1cnOsMIs
         FOApXDKfBfcEVFcWdHvANKcnmVbxtXQYJqawC7ACySjqkWaYOD9lJGL5N1lXxjPORfIE
         wEpzyyATyxbcme/P4JktxfkSwE4y6dOfufh+M7jK4Kusg18WwoFzRNApVVSpXMavkEKN
         zCU3k+ugAULQAw63Undg4q5K4HnsMMaZKTl/xaVzBhkTx+Ck90y/szP6vj1/XCLm+jER
         qL0A==
X-Forwarded-Encrypted: i=1; AFNElJ8Ub4b73pror8GNVnLTE56JsgDGTMb4MOtieNcitTHqYkwpeQS79cdtNP7yy3z5Q0uBG2CQ/MVGkY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuCiYghNF9eZfUYg0r/6jPrx//uR19Y9O9KdfWHYlCI1Ga0FX/
	bZ9dc+BrZVsCnjE2nhduEX3aiygumXpbEFccZ0WV9AY3glARQHiacMO4ZyE6uGzUgw==
X-Gm-Gg: Acq92OHT79GH8Jmuv1ed8OTPdjLZBGHz4Jbodi/yBDqC6aOIXmXmDMMweJQygLmtySe
	4g3JMUo7AdSH8a2VzUuK6Ord+j9dpTfpB0JySf+npWrgI7L1xXsMUINCZLr4V2IU3+coC9FB8kO
	Q6kpSJ7sn8H5pyPcgcokh4PbMZ3ccNJVosDz7g8hBp6CGSCFp3+qMuaOmECqeh1po1778FGQHWg
	ABlBoxq0hmPz54v7YMpVaVeiXPT3IYq7SzyhVCM4zht2PKSAY6pauYeScyuFQ9rBdXvnXLJPt0y
	NbMsxOy3otTIgIO98n1cwYM1V/D7xatmVewZQA5oEp8MEwM1mFvE/wcq2N88VIhsEO1vfC9umcy
	q3BzrNJmeemc6mhf0U+LMHgiDjhNsTxX6cRR+06sKdw9RebPkZvJ++PdZvl/uEL5rQW4kUV3xxo
	dDRXXPBgFKZ2z8vFQYNRPWdo+miRzkD44S/tDsH0CgDB/pvq+E2ouJ35MtkA2a8vknFoR9aCk=
X-Received: by 2002:a05:7022:671f:b0:137:9ab:2cb0 with SMTP id a92af1059eb24-13807ce58f6mr166369c88.22.1780741229038;
        Sat, 06 Jun 2026 03:20:29 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df349d8sm10350959eec.22.2026.06.06.03.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 03:20:28 -0700 (PDT)
Date: Sat, 6 Jun 2026 10:20:19 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 04/12] PCI: liveupdate: Document driver binding
 responsibilities
Message-ID: <aiP0Y_7dQWPpfS5H@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-5-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522202410.3104264-5-dmatlack@google.com>

On Fri, May 22, 2026 at 08:24:02PM +0000, David Matlack wrote:
> Document how driver binding works during a Live Update and what the PCI
> core expects of drivers and users. Note that this is only a description
> of the current division of responsibilities. These can change in the
> future if we decide.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Pranjal Shrivastava praan@google.com

Thanks,
Praan
