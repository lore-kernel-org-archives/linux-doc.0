Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF571390CBD;
	Wed, 27 May 2026 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779910934; cv=none; b=Up8WXSM2LauPq+8JkR2v2Mesrgc91ls2+fG86LAWW8oMTNSx8t1sW+U35zMmlnx7OBNik1hj7tA/KXz3Fj5AZXZ1hgDlJoB5JcD9WBpCN7Cmkv180bY4ifx0nSGyAC3RzQXGNyaD8GyZTfY/rXepjJD3ce4Ybh8P9/dRX8D9Cl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779910934; c=relaxed/simple;
	bh=hsuIsOnl6Qr1eNPF78/qoL76ddZnA5TTQYMnu6+Hqm8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=U3zar0B91tgm7drIpX/DyADpCLnYjfgp1czW7vnqJvjckYrELeEUNoW2/lL/xxc3q298mmwrWjF814CzcLVxLcnNgiadtumrh+f854MWvtNhj/WC/4AX1Y+nbyQ0EgAcGXeRnCSMs3tx2RDwb6liEDAq42G76xE3GpvcVDEw7IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=13eo1uib; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="13eo1uib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CD61F000E9;
	Wed, 27 May 2026 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779910931;
	bh=dzsx17QN9T0JhRcBqlGPVbrJ8cTzRmJjzv1xfhO6wsQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=13eo1uibBU6y9M444AohbuK0xlNn7QjIS9J9iqORqeWQaBv+RoLZweyr212MbtusU
	 ZsPVwuvGzdHlGaQl9axjxq38vLUKsKUIMyyRaup4vbbEMXfCrzkMhd/WZk7dQ8xd4w
	 N8KtcVr+EM4beW8uB9CcR11PWiBHxH7VRQMNzhpU=
Date: Wed, 27 May 2026 12:42:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH 0/3] delaytop: add delay max, timestamp and sorting for
 top latency analysis
Message-Id: <20260527124210.19726c1c89a94b89310e5a47@linux-foundation.org>
In-Reply-To: <20260527215524044fG7XSpgveHiaFhraq0yAi@zte.com.cn>
References: <20260527215524044fG7XSpgveHiaFhraq0yAi@zte.com.cn>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 27 May 2026 21:55:24 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> 
> Previously delaytop only showed average delays. This patch adds:
> 
> 1. delay_max fields to track the maximum delay value for each delay type
>    (cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy)
>    per task.
> 
> 2. The -t/--type option displays only the specified delay type with avg/max
>    values side by side, allowing focused analysis:
>      delaytop -t cpu    # Show only CPU delay with avg/max
>      delaytop -t wpcopy # Show Copy-on-Write delay with avg/max
> 
> 3. Wall-clock timestamp when each maximum delay occurred, displayed in the
>    MAX_TIMESTAMP column when using -t/--type option. This enables:
>    - Identifying the time when a process experienced an abnormal delay max
>    - Correlating delay max across multiple processes at the same timestamp
>    - Cross-referencing with logs, traces, or other metrics at that time
> 
> 4. When using -t/--type option, tasks are sorted by maximum delay value in
>    descending order (largest delay first), enabling quick identification of
>    top N processes with highest delay spikes.

Sounds useful.  Am I correct in assuming that you're a regular user of
delaytop and that these changes are based on your experience with it?

AI review claims to have found a number of things:
	https://sashiko.dev/#/patchset/20260527215524044fG7XSpgveHiaFhraq0yAi@zte.com.cn
