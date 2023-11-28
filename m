Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72CB41C6C
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTXC6egi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC732C433C8;
	Tue, 28 Nov 2023 17:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701194267;
	bh=NGmfjNMsc8MTcobjGt/SD7zw/1t1pkX0VqePmSopdm8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dTXC6egirGlbMaSupo1pofhXHH5Crhtyt5gOzv2fhTahh0xcxufVmu0fr68m+mfxy
	 45npWDLjm4Kh1nFDmMF5KyDrkqAGX5Y/FlKV0HjtF+qhvV/TicDBj/Ze5vbBwmaZ/a
	 UJw+D9Eadpcr3FsNSqU6tc1nDWgsje64YqJxnK5HhceN4tzGlzZ1gGTmaLhJWLxOSO
	 fyySka2RHYSHWEwd4tli8vA6eBamVtWoRb8vTtjUAJ+mxmqcARrBJy+fD5EX2rztTQ
	 8qHq6rqWgbEWFDaRrrCBdO2ebnc2kRhRex4FgnQLrc8PB1GBJeIjA5MB9u4IAqj7a6
	 YMQukS9DakoGQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Donald Robson <donald.robson@imgtec.com>
Cc: frank.binns@imgtec.com, matt.coster@imgtec.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 daniel@ffwll.ch, corbet@lwn.net, Stephen Rothwell <sfr@canb.auug.org.au>, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20231128173507.95119-1-donald.robson@imgtec.com>
References: <20231128173507.95119-1-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH] drm/imagination: Numerous documentation
 fixes.
Message-Id: <170119426454.2880479.7880420344825217508.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 18:57:44 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Tue, 28 Nov 2023 17:35:07 +0000, Donald Robson wrote:
> Some reported by Stephen Rothwell. The rest were found by running the
> kernel-doc build script.
> Some indentation fixes.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

