Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEBA42B311;
	Fri, 10 Jul 2026 13:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688460; cv=none; b=c1geC0TXW5aDgGzXDfepANe2K2ApaxMhMi6bsyq6uHmKHJFB2XGJ/ec/OFRPHTmGXenxJ5rBEAh4b0Z6wFPUnxbW5rxHkxSFBZRXqQhlv+AF//FZ58wXVVS86Q66GZg4ZdZw6gPAjR0gHI5PJfaoIx+sHCyZxowppdAh538kY6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688460; c=relaxed/simple;
	bh=YcxbQ2Btzg7iuA1pSYuYSjQQft9gHlB/8xDODM4Q9dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UR+ala2qm1ahuGvzouT0HR3B2QehCwt9FW2X12ym6RzN/MBa71J774XdIkXgpuYpG5mYDuRNYa7wPB0V5ZClOJ2Jwjrud1WX4j8Hyd29v5UUGZ6Vq2DEJdjvy9Jdp2qCaVpGUxvpO6EbbvK1SQTqD8916pIwnAQpwB4DVMM5gEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=QErSRtrM; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="QErSRtrM"
Date: Fri, 10 Jul 2026 21:00:33 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783688454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymO/MhynCVa2Vt6zoxXVJAmYlve+weaHSl/T20TzvNQ=;
	b=QErSRtrM4OkydiPspPZ8iIyW08vsaSM2g5dfPY/8t9/AG7UGnaa5xeGIgx7XH5yRCJC7du
	e/ZHt+M10x4Qok2japnjjLsKaYPtZvGba+6S1x1WKOkaR+3ZCc7h5jhaSOYtHlB3bx6aJp
	zLKHGVTTsTjRCRfQ2lZUjgoMr1gK3/sg6Ct/z3VCzAkzZ4LCISIaV3/xbs015/CyNTUNA/
	dEAfw79XdGUWGRjoJtFpyAvghAlEYCpJSFlHhS3uxbpblmLSFGA9wnlgreqvxSYzTxQRpe
	ekDYg27jE/MMLJFE6xgoUBr7qRN+7UbjeTgIbVhrRL9XDKFyy6TR/umFRoCBXA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Dongliang Mu <dzm91@hust.edu.cn>,
	Yuchen Tian <cat@malon.dev>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
Message-ID: <alDs8bnIK8bWApIr@wyuan.org>
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 10, 2026 at 04:49:30PM +0800, 葉宸佑 wrote:
> Gentle ping.
> 
> This v2 addressed the review comments from Alex and Dongliang.
> Is there anything else I should improve, or is it queued somewhere
> I might have missed?

Hi Chenyou,

I think currently having Alex apply your patch is a temporary measure,
because the maintainer of traditional Chinese seems unlikely to be
available in the near future.

Outside the patch itself, I noticed that Traditional Chinese is actually
in a state of stagnation, which makes me think that receiving such
patches is a temporary solution rather than a long-term fix.

As Jonathan said, "...But there does come a point where a translation
is so obsolete that it does more harm than good and there are no
prospects of it being updated." 

So, after a period of about two years of stagnation, the Traditional
Chinese documents seem to have really reached an unreadable state. This
is something we don't want to see, but we must accept the reality and
then take action. Please note that I have no intention of offending
Haowen. On the contrary, I am definitely grateful for all that he has
done.

I did some interactions with one of the L10n Taiwan team (who are
involved with Git L10n) [1] in their telegram channel a few days before,
but sadly they said the biggest problems are:

  1. No one is willing to take over. (hey, I totally understand)
  2. There are different opinions on translation. (I don't know the
     deeper details)

Besides, I'm also very curious about how exactly we define the position
of traditional Chinese or zh_TW. From my rough observation, the existing
documents merely performed a simple conversion between simplified and
traditional Chinese, without taking into account the local expressions
specific to Taiwan. Therefore, that's why we are receiving the patch
here and commit aba18be23f14 ("docs/zh_TW: replace 接口 with 介面 in stable-api-nonsense.rst")
(Please correct me if I'm wrong, as I have not got into many
translated pages)

So if we are doing zh_TW instead of a direct simplified and traditional
Chinese conversion, I don't think we can handle this properly without
the help of Taiwanese friends.

Of course, I feel quite ashamed that I'm saying these above here without
having made any substantial contributions to this community, sorry.

Could we discuss this matter in another thread? Very sorry Chenyou, what
I'm saying is completely unrelated to the patch itself.

Finally, I would like to express my sincere gratitude to Haowen.

Thanks,
Weijie

[1] https://l10n.tw/
