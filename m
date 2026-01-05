Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57B8341050;
	Mon,  5 Jan 2026 16:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767631194; cv=none; b=c2U3WvxzxxUwjuZWPzSgo6jIQC6gyY914akxqyHHgQdhcTDj2PPDCaYaTjnrwKCV93STWyg9y2uYpMrumFkLp97k09KVvtS2YfWo46Uoe8rY2PF71oM4AekZP6EtHlnYx+SkMByG0aBF3qwsKLbQEcK8kv8PjWNNrsrlqW/ht3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767631194; c=relaxed/simple;
	bh=/ZpB12lnlLx4ZXxT5sFB4LXCVD4Mgmv5anHeq1/U0zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EsWg/MhvQpom0CAmJ+sjiOGEJPkZZ9BBghmwHGbzt/8Ozv1GEqs+GaVVkZpXssN/Not7zr4puScY0aiIWVny0AqlGxCyQiYT3hGGiaSMEMEJO4HR7hhCSA5wrrX1G7v93JmLege6yhTk4AXcaCph/YmubJTk1E9v1Hm6thK0dz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 355D7339;
	Mon,  5 Jan 2026 08:39:40 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51E113F6A8;
	Mon,  5 Jan 2026 08:39:45 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Leo Yan <leo.yan@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v8 00/13] coresight: Update timestamp attribute to be an interval instead of bool
Date: Mon,  5 Jan 2026 16:39:33 +0000
Message-ID: <176763112483.1193329.14214589661973805304.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Nov 2025 11:55:12 +0000, James Clark wrote:
> Do some cleanups then expand the timestamp format attribute from 1 bit
> to 4 bits for ETMv4 in Perf mode. The current interval is too high for
> most use cases, and particularly on the FVP the number of timestamps
> generated is excessive. This change not only still allows disabling or
> enabling timestamps, but also allows the interval to be configured.
> 
> The old bit is kept deprecated and undocumented for now. There are known
> broken versions of Perf that don't read the format attribute positions
> from sysfs and instead hard code the timestamp bit. We can leave the old
> bit in the driver until we need the bit for another feature or enough
> time has passed that these old Perfs are unlikely to be used.
> 
> [...]

Applied, thanks!

[01/13] coresight: Change syncfreq to be a u8
        (no commit info)
[02/13] coresight: Repack struct etmv4_drvdata
        (no commit info)
[03/13] coresight: Refactor etm4_config_timestamp_event()
        (no commit info)
[04/13] coresight: Hide unused ETMv3 format attributes
        (no commit info)
[05/13] coresight: Define format attributes with GEN_PMU_FORMAT_ATTR()
        (no commit info)
[06/13] coresight: Interpret ETMv3 config with ATTR_CFG_GET_FLD()
        (no commit info)
[07/13] coresight: Don't reject unrecognized ETMv3 format attributes
        (no commit info)
[08/13] coresight: Interpret perf config with ATTR_CFG_GET_FLD()
        (no commit info)
[09/13] coresight: Interpret ETMv4 config with ATTR_CFG_GET_FLD()
        (no commit info)
[10/13] coresight: Remove misleading definitions
        (no commit info)
[11/13] coresight: Prepare to allow setting the timestamp interval
        (no commit info)
[12/13] coresight: Extend width of timestamp format attribute
        (no commit info)
[13/13] coresight: docs: Document etm4x timestamp interval option
        (no commit info)

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
