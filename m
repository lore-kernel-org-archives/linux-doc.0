Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7B9305664;
	Wed, 29 Jul 2026 01:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288711; cv=none; b=NxZ5W4MPlrd10lRqgATQmytaJbRWB02FViFS3UyjPdNGquyJy1YYLszur9Wu4WOO1q8MwS2vZiPvh4L6nIFZ5GhmHeG3Y7dS3/42IuLoDhaw2OMbSDsEMtjO/KwEbNVNkxO4lm6SC6fT8wF0IuvVF2CIwH0YWhgdC6nVMltOxRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288711; c=relaxed/simple;
	bh=frzX/xOGJ5Kgm74EOfxb8ozszanIy4Wqkh9uRtVjTwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oP7o6tLhclZcGlU7NZkCLbIa5Ff5scqn+1TN6qvOVV6D4WHrkRvE+AyV69Pb+F0rbxNyyLj5Kxd3yTac77jtdGoNnxbZ9HXu/u6Jeys7Oi455uiqAJgNpfYM6714ipMcn1afSGxum5oHUpPkHH+T9Vs1qziFifQ/2jQmsK6GBks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQCp7Xgb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQCp7Xgb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB641F000E9;
	Wed, 29 Jul 2026 01:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785288706;
	bh=u9YL/AUgZaTUp2LZhQTyw5gcZtyvcKsAIVAnQLIKKas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hQCp7XgbqDjuB2imSSdaDEtJj36cD2pmNOeYmlQ8uvWBubkWCOjNwfeFw3lU6c2XF
	 8mtjojdrXnVsmrW2i47G7ef0ivKvYq6aO1Vb8X2wdC5Nbg9x5s79dXHbNYBeAgruMo
	 rXbf4LkrGjtutYYODS17sjv4XLFuUp/nxZeMtwBJfm/Auq+CCXmonsg9G+qzoK+Kkf
	 9QrAcMAAoetLuB01ISDQVUOMftJrz7qDIvnfnzNzgUVHHrYn1Mqh24ImfbSwtAdVFN
	 Qs4UF51HvrFhl24pMsGE0sigWMyDaJRKjmcySO+cWv8rVtHR6H1zikVe26sSHJA6Sy
	 PkHT7yAbZqOfQ==
From: SJ Park <sj@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] Documentation: zram: remove sections numbering
Date: Tue, 28 Jul 2026 18:31:38 -0700
Message-ID: <20260729013138.125120-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728021229.181627-1-senozhatsky@chromium.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 28 Jul 2026 11:12:11 +0900 Sergey Senozhatsky <senozhatsky@chromium.org> wrote:

> Those numbers are difficult to maintain and in fact
> we can refer to sections by their names (in html).
> 
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
