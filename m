Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB36339AB
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 23:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 188B3EE;
	Mon, 16 Oct 2023 16:04:01 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FC031FB;
	Mon, 16 Oct 2023 16:04:41 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 364D13F64C;
	Mon, 16 Oct 2023 16:03:59 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linaro.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	coresight@lists.linaro.org,
	James Clark <james.clark@arm.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V7 0/3] coresight: etm: Make cycle count threshold user configurable
Date: Tue, 17 Oct 2023 00:03:54 +0100
Message-Id: <169749720983.709368.13661754156308362398.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921033631.1298723-1-anshuman.khandual@arm.com>
References: <20230921033631.1298723-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, 21 Sep 2023 09:06:28 +0530, Anshuman Khandual wrote:
> This series makes ETM TRCCCCTRL based 'cc_threshold' user configurable via
> the perf event attribute. But first, this implements an errata work around
> affecting ETM TRCIDR3.CCITMIN value on certain cpus, overriding the field.
> 
> This series applies on coresight/for-next/queue.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: Leo Yan <leo.yan@linaro.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> [...]

Applied, thanks!

[1/3] coresight: etm: Override TRCIDR3.CCITMIN on errata affected cpus
      https://git.kernel.org/coresight/c/0f55b43dedcd
[2/3] coresight: etm: Make cycle count threshold user configurable
      https://git.kernel.org/coresight/c/0cf805fec179
[3/3] Documentation: coresight: Add cc_threshold tunable
      https://git.kernel.org/coresight/c/2b690bebb569

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
