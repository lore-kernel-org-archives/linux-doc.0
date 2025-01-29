Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134611712;
	Wed, 29 Jan 2025 01:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738114473; cv=none; b=Ss8NcVR/nmR54UJVJvVZHEgy33UQzuqmI5Jk6lsPtHnSZYxhBUwAR8/S71w0Kub8tyR9kAN7HZWvN44AW2UGfQ+Mm9SGhVV9XiYP/fmmH+0jDxIgTdnf0wiqs5wy0jqhR6sMar+eCYNi1MG4MAzsWeJUXhq0xOt8FB2lPvr8wPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738114473; c=relaxed/simple;
	bh=qTpH+3EkfqX9K0zHGxce/DkQWkkHTToa1uoNxk/97Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HlmyXeHJ2YvFc39RISirQDnhftEIlVdz2Iw87kqaYbpzbpKi6x9d22iZkz6mHjbQ1dFkCN7OHcFCIW4+8qAbeh64QX41Q/PyFFZI9uJoF5j2PZUl96IMdXHv8/vsZ15uJ4AHE/uhuiem2iwC3TKIum6QskJHE1xdwPIm7S3Uc6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHC7hADw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHC7hADw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8A5C4CED3;
	Wed, 29 Jan 2025 01:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738114473;
	bh=qTpH+3EkfqX9K0zHGxce/DkQWkkHTToa1uoNxk/97Dc=;
	h=From:To:Cc:Subject:Date:From;
	b=rHC7hADw76CFDhpZFKKRIGdbUe5l852E5XtX6qeUfGftYbaAh6KB1GL0edfHdXMEN
	 Mg3F7QCNf4bStTE3lqQyfxP+b0w27jp/ssFL/8+ls5yXujqSmFWpYIsEGCEnXHy02W
	 eh7FbB3jeYIHFXqME7gm7C/xqDQ20axFCEFpw/h5BgXirplseVDyY2P7Er8yxn76hk
	 7JKmL6ycMJZnfukDQ9MZ4wr42B0Zpqzh0jRTHMQir8GJETbVSmWOievnJYTDQCrS2m
	 yGUnd3R+KwzAcSzy++F1hN7xzE2BKfDp+Byx/DO5w55xkEwJrDXkwIFxMVYVTZ6CCr
	 niC5YMEtbp3vg==
From: carlos.bilbao@kernel.org
To: corbet@lwn.net,
	willy@infradead.org
Cc: akpm@linux-foundation.org,
	bilbao@vt.edu,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH v2] .mailmap: Remove redundant mappings of emails
Date: Tue, 28 Jan 2025 19:34:30 -0600
Message-ID: <20250129013430.1117720-1-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Carlos Bilbao <carlos.bilbao@kernel.org>

Remove two redundant mappings:
changbin.du@intel.com -> changbin.du@intel.com
viresh.kumar@linaro.org -> viresh.kumar@linaro.org

Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
---
 .mailmap | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 0768824e9d19..db80156f344b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -143,7 +143,6 @@ Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
 Changbin Du <changbin.du@intel.com> <changbin.du@gmail.com>
-Changbin Du <changbin.du@intel.com> <changbin.du@intel.com>
 Chao Yu <chao@kernel.org> <chao2.yu@samsung.com>
 Chao Yu <chao@kernel.org> <yuchao0@huawei.com>
 Chester Lin <chester62515@gmail.com> <clin@suse.com>
@@ -720,7 +719,6 @@ Vinod Koul <vkoul@kernel.org> <vkoul@infradead.org>
 Viresh Kumar <vireshk@kernel.org> <viresh.kumar2@arm.com>
 Viresh Kumar <vireshk@kernel.org> <viresh.kumar@st.com>
 Viresh Kumar <vireshk@kernel.org> <viresh.linux@gmail.com>
-Viresh Kumar <viresh.kumar@linaro.org> <viresh.kumar@linaro.org>
 Viresh Kumar <viresh.kumar@linaro.org> <viresh.kumar@linaro.com>
 Vishnu Dasa <vishnu.dasa@broadcom.com> <vdasa@vmware.com>
 Vivek Aknurwar <quic_viveka@quicinc.com> <viveka@codeaurora.org>
-- 
2.43.5

