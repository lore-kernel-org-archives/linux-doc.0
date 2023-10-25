Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410411F922
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 585B5133;
	Wed, 25 Oct 2023 03:23:07 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89C622F4;
	Wed, 25 Oct 2023 03:23:48 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2B3F93F738;
	Wed, 25 Oct 2023 03:23:05 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Vegard Nossum <vegard.nossum@oracle.com>,
	James Clark <james.clark@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Rob Herring <robh@kernel.org>,
	linux-next@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	coresight@lists.linaro.org,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] Documentation: coresight: fix `make refcheckdocs` warning
Date: Wed, 25 Oct 2023 11:22:58 +0100
Message-Id: <169822933857.1034160.3403162246567541571.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231022185806.919434-1-vegard.nossum@oracle.com>
References: <20231022185806.919434-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 22 Oct 2023 20:58:06 +0200, Vegard Nossum wrote:
> This reference uses a glob pattern to match multiple files, but the
> asterisk was escaped as \* in order to not be interpreted by sphinx
> as reStructuredText markup.
> 
> refcheckdocs/documentation-file-ref-check doesn't know about rST syntax
> and tries to interpret the \* literally (instead of as a glob).
> 
> [...]

Applied, thanks!

[1/1] Documentation: coresight: fix `make refcheckdocs` warning
      https://git.kernel.org/coresight/c/fa55e63584f2

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
