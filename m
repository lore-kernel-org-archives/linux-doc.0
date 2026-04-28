Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF964373C13;
	Tue, 28 Apr 2026 22:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777414283; cv=none; b=HlPK8PAOMrCfhES1ckvjk8oZJ+3wIQnejj/XAmQzcPIlBFOKkDbw9JZpwkS6z9oJg5BzImG+xH+rpRPUzri6yJxZ+6cQhU+uURBP/OaXLoe7GcLaN4wo7vgrAH/at6dOQc5TJ7i2aD+ZYmxfVKJN75yezJ60qNg4V5CN/y3YQnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777414283; c=relaxed/simple;
	bh=KO25byLjS3kq8Wtgw9TvyHDCbLGnzQOZ1aKBxXn9sDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SlDldpyK1cyAgYUwn22zmqu1HqfjNSQI0tlcDasaRlMw02/C1KbVQi8iE4codfaVA2MJAVA8AnxX9hMIWmU8AKAuq15dmcZFQaS2vQmg0euj91XU5QrmRUPPCcxrYpKL4F4rkf8qcsOlqN0G8dnkswEtg7cupLr7P1wlqJrgY8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1p0yhlM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1p0yhlM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5E3C2BCAF;
	Tue, 28 Apr 2026 22:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777414283;
	bh=KO25byLjS3kq8Wtgw9TvyHDCbLGnzQOZ1aKBxXn9sDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a1p0yhlM+keicgFWYclQr1WCP8IWirQ+o5ZjIWtH4cIV6t+SJB4KMDROWYXr2Vj/2
	 qpWfpq8Ug6dE5k/oG74O10POM6ymyenXf5eHFKYjhTf3PkAXxEmQkHTMmtTPovjRDC
	 a+srHJ2euU72HiGZkngljklmhqDjc5vJExkr5xnF9Kt+y7v1Uqg3vx13yZlK3ti+Wh
	 ajDs/zMRfaMf8PqP/JHXOzVxSR3NADzvCirJdRHKyeXc92P2qMVBQVHoRRFyEr7YXO
	 AFyzLqgotOPM4iRFA02XhMrQsnYeHnCQM9MFEjAXBIVDFqJZI+kY8j2vhfd/js04ka
	 ViOSiIyTNSXNg==
From: Danilo Krummrich <dakr@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] Documentation: update deferred_probe_timeout cmdline parameter documentation
Date: Wed, 29 Apr 2026 00:11:18 +0200
Message-ID: <20260428221118.2686159-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260416144144.54547-1-johannes.goede@oss.qualcomm.com>
References: <20260416144144.54547-1-johannes.goede@oss.qualcomm.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 16 Apr 2026 16:41:44 +0200, Hans de Goede wrote:
> [PATCH] Documentation: update deferred_probe_timeout cmdline parameter documentation

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] Documentation: update deferred_probe_timeout cmdline parameter documentation
      commit: c9447f101315

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
