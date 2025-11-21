Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E6928750C;
	Fri, 21 Nov 2025 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723141; cv=none; b=CJARDgZg8u7idb/v5p8YrLWGr1JkuSgcfLA08zB9OnPJIQUKohxskFi0hdDzVxZC6QYR+0Y9491Trg8XDENX92spPhH40XYJuTuPcYJWwLaZ1yF4EGvcC1xqOUq9gMmRuYgs6abpZOyv3+s8Gk+MxraWWLIWh6vfbFTq/4ddPiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723141; c=relaxed/simple;
	bh=yHPEke+d+ENBOFuR4a06bgPgAax4Feq8erNO8RMzGfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oc4+cmIMGngzzxriat3IpHo9BBQx7qXUmqpnPF8uTBZOCe2JTG0xnwUfkQIh+MySKv+mK1D2oR+Mh1coEQHimF1MidhrCn/q5KR7/DeQuyCHz0t09htOb5QEG0+CGDrx7x+x732C42fhMJiFI0vY1B2VQO35traNtgOHD8a4R8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4LKc++Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4LKc++Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D17C4CEF1;
	Fri, 21 Nov 2025 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763723141;
	bh=yHPEke+d+ENBOFuR4a06bgPgAax4Feq8erNO8RMzGfU=;
	h=From:To:Cc:Subject:Date:From;
	b=T4LKc++YEA5VYq4vwZtdcrXX7fO2ixBgoWmKstRR9EXX8gMLuuYAvy74MgYUTognk
	 7gwEYaZ+SPL9by7zBEf3IL27jPzb+iHo8UYDLxhF5Fi1XM03Or9hnycKCcYXAUcZ4Y
	 v/pdM+b0SxK7odwSiVb3nICzmaNn4asc3Xus434MQ6gMm/nUlK6Y3ONFlSvioVcBIW
	 eLroZvHS8Fg6cq238HXz/BeDas69UulNGX8YBPNaXMycsOz90K//Jy+CkCULUNmZ1x
	 W4ST7tJ2LVP8xmEq1c8FZuirjJlsFKE1g3cecFfpE6ivW6h6miIZ+IL6Z6/0h2gP1G
	 q9LYc9EbV5/hQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vMOxP-0000000EyXd-10V2;
	Fri, 21 Nov 2025 12:05:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH v2 0/1] fix rustdoc build detection
Date: Fri, 21 Nov 2025 12:05:27 +0100
Message-ID: <cover.1763722971.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Current logic doesn't use the right value for CONFIG_RUST. Instead,
it picks the value cached from a previous non-doc buid.

After analyzing the issue, it was not caused by changing the logic
to use the wrapper, but, instead, to the way .config is currently
parsed. For more details, see:

    https://lore.kernel.org/linux-doc/20251121101236.5b1f9989@foz.lan/

---

v2: changed patch description to better explain the issue.

Mauro Carvalho Chehab (1):
  docs: makefile: move rustdoc check to the build wrapper

 Documentation/Makefile          |  6 -----
 tools/docs/sphinx-build-wrapper | 41 +++++++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 15 deletions(-)

-- 
2.51.1

