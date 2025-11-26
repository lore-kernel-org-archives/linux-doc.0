Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D021A11CA0;
	Wed, 26 Nov 2025 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165644; cv=none; b=EP2+Qgjb7Kn6cKxLbL+MTrL/zSZE6IQN6eqIpMqQpj7Td1sLfUs54IR3NmmZlId0ed7Ch0FcrjhIZCh4rI1u2mWXlEAg3LwNO51upDnTNnv9R1KITaPV/DzGRae4vL5yt/l/VBepHPLAEjGRR9Q0nW6yZvBtH+O2ZIDAtrzsscg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165644; c=relaxed/simple;
	bh=UvH7ojB/vxmFB332y7b38126V7tclsiXT63XbRooIjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bI1a+i2q5g8vNFLLSBa1caQqB9/k62MIjB/QVW7iMvIn4HGJhEePPILEUpNNHjflKR3hBCRjzKFifl7C+OuQiDarmqlN/9pzM5ewYiN1vO67UJD7pxI+OUlAw87WWcRskB+mGhTasuNSO9YMisiVuk0YoNuPX0LYGAbFHGgovqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFBAA168F;
	Wed, 26 Nov 2025 06:00:33 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B07783F73B;
	Wed, 26 Nov 2025 06:00:40 -0800 (PST)
Date: Wed, 26 Nov 2025 14:00:38 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
Message-ID: <20251126140038.GJ724103@e132581.arm.com>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>

On Wed, Nov 26, 2025 at 10:54:29AM +0000, James Clark wrote:
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
> The interval option is added as an event format attribute, rather than a
> Coresight config because it's something that the driver is already
> configuring automatically in Perf mode using any unused counter, so it's
> not possible to modify this with a config.
> 
> Applies to coresight/next
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Tested on Juno-r2 board (though all timestamps are zeros but it still
can record timestamp packets):

# perf record -e cs_etm/timestamp=15/ -- ls
# perf script -D | grep I_TIMESTAMP | wc
   1324   11916   84561

# perf record -e cs_etm/timestamp=14/ -- ls
# perf script -D | grep I_TIMESTAMP | wc
   2415   21735  154205

# perf record -e cs_etm/timestamp=1/ -- ls
# perf script -D | grep I_TIMESTAMP | wc
   130743 1176687 8359898

# perf record -e cs_etm/timestamp=0/ -- ls
# perf script -D | grep I_TIMESTAMP | wc
      0       0       0

Tested-by: Leo Yan <leo.yan@arm.com>
