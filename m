Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7A934CEF
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 18:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hH0pl6E7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A94C433C8;
	Thu, 12 Oct 2023 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697134021;
	bh=sTUN/S8uDSXmOtLaR38bGCwiAqCoUVYoh6JYKFIP1A8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hH0pl6E7hi3RBThDpDfoKqyo3pOV51mmXfcx22ueXnsN5QQBhkFkki7tcJ8/SZAUa
	 eMA2JZQGzGG8amDFsO9y9e02NK/mtYNoQTrOmuGBR3J+BlIr4Q/ZF/e/XpY8tzBVY8
	 T40TtWJmO7vX1ymRGuB632hvj+K+KGfznB5sXlLZPgpVI60I+BxLzaoG5szBJ4hOIV
	 BvaiMHIcU90TCSdzoyEuUbqOjru0FPD9AHKvif3qWjC1+rscJTTT2yzsLKbNeOggnP
	 QVP4QNU6i3cuILRm5lGq9N+OJ6XOaN5NYOwhvG00TZB+XpGJXTGrXx+CInzYgxzHvh
	 cXv4T0IXdYvvA==
From: Will Deacon <will@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Kan Liang <kan.liang@linux.intel.com>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/perf: Add ampere_cspmu to toctree to fix a build warning
Date: Thu, 12 Oct 2023 19:06:45 +0100
Message-Id: <169711035718.620662.14569191392067573521.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20231012074103.3772114-1-ilkka@os.amperecomputing.com>
References: <20231012074103.3772114-1-ilkka@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 12 Oct 2023 00:41:03 -0700, Ilkka Koskinen wrote:
> Add ampere_cspmu to toctree in order to address the following warning
> produced when building documents:
> 
> 	Documentation/admin-guide/perf/ampere_cspmu.rst: WARNING: document isn't included in any toctree
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] docs/perf: Add ampere_cspmu to toctree to fix a build warning
      https://git.kernel.org/will/c/0abe7f61c28d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
