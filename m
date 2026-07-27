Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AA931714F
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141758; cv=none; b=As5wXN9TY5wIrwfWKr6hDSkOzZxGIZzXDCSwIVZvGno4sFxDOFS4kufudiPTblzsR0LU+amXvTO7RjfwBuBoVr5NSoSuTb7olVYat3qupIrQqcKnTJadHEj80D4z2VAyA5ZiAPbBxDlKZvP3gBO/RZapYvBZsaMlQvmIbxu9/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141758; c=relaxed/simple;
	bh=Rqr7CXPyaaH+S59DULICOUSqV8s9JKZLeuz16mc7RPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CESpH0tZq2fmZDpzmIOt2hwhtYA8HRh2rHIgNgVwXuo28q90JRcoN9SHCUd7qNJ9Qzl/HesOvBeHPqEGDaKaSYk6p0KKLT1P2MufZFZae8bGmud/dIKq59n2FxgblJQRPYwI0j8AfAymZfp/WY4DawWWvdx6g3WZ6O9z2HZ0Tas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=yBCngZk5; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="yBCngZk5"
Date: Mon, 27 Jul 2026 16:42:13 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785141753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=JQVSIPsroWAkC6gt40e3Zc0nLzCmVOwF8QJzhO9oGcI=;
	b=yBCngZk52CT7K2M0Re6s2eADsKckds6NCAZ5rUZGPPFMKeOosKCSWFyxYmOXzlRaIceY+y
	8uVzZl7PQROsXaPODEhQ09mUNTGFPzf7F985ac8raLYHHhFjBiTQazradhJvqU/pUbbGBc
	EVV/fcI4iIVZakDJKz8zzgQw6eC5TsOhGpdVCwqQjTByWFeF7Z2boqcdtnFh7s9Lg0idQE
	ekKzR62rPtB6o/Pb4cJzpWy0JYo/xtDeLjJS8UDo/FJlnoq4TGMcGVWHbfUNYkLiLbxWgq
	qxnxoOxGGe78wFlrcGf9gqSBSvaKOES96D/ckUV4AATHGALnkJKmDThaI/Xpjw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC] Plans for zh_TW: prioritize maintainability over coverage
Message-ID: <amcZ5SI3-Hzw4HkJ@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

Hi Jon and Chinese documentation folks,

Recently I reviewed Jon's talk titled Kernel documentation: update
and future directions. In short, he said we Chinese people are
active, and he "even" thought why somebody is willing to read some
kinds of stuff in Chinese ;-) This led me to reflect on our current
situation.

                         Translations

      +-------------------+-------+----------------------+
      | Language          | Files | General state        |
      +-------------------+-------+----------------------+
      | Chinese           | 332   | Active               |
      | Chinese (trad)    | 97    | Almost abandoned     |
      | Korean            | 5     | Abandoned            |
      | Italian           | 67    | Occasional updates   |
      | Japanese          | 7     | Abandoned            |
      | Spanish           | 37    | Rare updates         |
      +-------------------+-------+----------------------+ Dec 2025

       https://www.youtube.com/watch?v=JXtx_zOHFgo (31:52)

       As of July 2026, checktransupdate.py reports the following:
       zh_TW: 51 translated files are out of date, involving 221
       distinct upstream commits in total.
       zh_CN: 171 translated files are out of date, involving 617
       distinct upstream commits in total.

First of all, I definitely would love to show my truly respect to
our friendly contributors, but considering the sustainability and
maintainability of the translation work, and more importantly, its
forward-looking nature (in line with the original English version),
I think we need to make some trade-offs.

It comes to me what the maintainer of Sqlite D. Richard Hipp said
about open-source or free software: there's free as in beer and free
as in speech. But there's another one: free as in puppies. When
people send you puppies as the gift, you're morally obligated to
take care of them. So, it's basically what's going on with our work:

  Nice and friendly contributors show up and give us their
  translations and walk away. If the original English page gets
  updated, you'll find that for most of the cases our friendly
  contributors won't show up again and maintain it, i.e. update it
  as expected.

The facts could certainly have been exaggerated. For both zh_CN&TW,
some articles have indeed remained unchanged for decades. So a
single translation is definitely a one-time solution, which means
they don't need to be touched often.

That's fine with zh_CN right now. But for zh_TW, we have a
significant gap and lag behind. You can easily see it from the above
table. So now we need to prioritize and get things done.

Therefore, for zh_TW, our expected plan is to monitor a list
containing important documents or folders (such as process/
submitting-patches.rst), and set a certain deadline for the latest
update (which can be discussed later, maybe 1/2 months): If no
contributors would like to update it, we as the maintainers will be
responsible for making the updates to ensure that readers who come
across this translation can be assured that the translation is
reliable and not worried about being out of sync with the English
documentation for too much/a long time. We may make the supported
set in the index page, and list out the current "well-cared"
directories or files.

That is to say, we will deliberately select relatively important
articles for translation and hope to maintain this consistently
first. By avoiding the large expansion of the translation coverage
we can't handle, it is possible to truly ensure the quality of each
article that has a translation.

Since the goal set for zh_TW was to catch up with zh_CN first, when
Chen-yu was working on the common articles this period, I was
extensively reviewing the existing content to determine the priority
of traditional Chinese docs, according to the importance and reading
volume, etc, and thereby deciding which specific parts should be
marked unmaintained temporarily.

Sorry for being so lengthy. In summary, our primary goal is to
ensure the timeliness and quality of the translations, and we will
also strive to expand our coverage.

Please feel free to leave your comments.

Thanks,
Weijie & Chen-Yu
