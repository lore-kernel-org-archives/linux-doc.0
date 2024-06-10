Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79139558B6
	for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007040; cv=none; b=VIP8HQLcl7+HILqutyOsn7N87+fQp+Y9XQnTUahgTbPx9wjTbUlKGffNhrmC6GgW0T2CoQ0q5m2GasZsmZKQ5Aw4feWQ7f4Hk35h4Am+8eXjXv34omGjY7E97y6/VkE7WZy4k8PPSCKtlfbT3LyZB7iQWl8EhM33XvZbI2GStDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007040; c=relaxed/simple;
	bh=Om3tgtvL7zx3STVEfGcFIyutGvx1ayQHvev9/xlcvdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y+u98C/9cmdXj7/xsp3XWPUY2j48DGjPGufFeHNlwmMrHStY3HMmCX1n4pgVk676HAz3K/QGpOIr0bhm5OsyIbNcYOX0/wBwizez1EGB3U5+CkjORzBxm3GeRWCluKklIqcAgI+EY6za6hJYipLxZLhzPdS06z+cwyN0sYZ3NN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FdX0mw0+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FdX0mw0+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=k1; bh=o
	+WZ7wY84tNezlQl5CxbAAB2zMVOpXowsJm/tB2JR/k=; b=FdX0mw0+lO7O1XzDU
	CTjTTg0UiLt6zpybDPD4iI73HmqGnIpSjzoYaSSDqhT5gORKbeiUszsK6VvB8QvR
	2Vb7RzGxQItlAWjr4mXdN7P1hBieXVIb0IYhX6y64+WM796qtH/iJyfd+Veazlx9
	7AIInchkuFIWHYcXKt3cJ65Zqa6r98dTFelO+5OXXNbacdk3uUC2DTRXfubExOCF
	0NLleYl+JJgyVne3fHGztomQNhtx4fRNqNYsHQ6odS7EyAElbZl0MAY4OHiENoLc
	+/vx8hcr++MKPkRPxZiCyqY5LiB21auctFl1VySN9qwNAa0ETZI5ZzD5J+fGIr51
	6qe8w==
Received: (qmail 4192364 invoked from network); 10 Jun 2024 10:10:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jun 2024 10:10:25 +0200
X-UD-Smtp-Session: l3s3148p1@Eu11roQauuYgAwDPXymAAHMyzy0c7Kdl
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-doc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] docs: i2c: summary: update and use inclusive wording
Date: Mon, 10 Jun 2024 10:10:15 +0200
Message-ID: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The main motivation for this series is patch 4: switching to
"controller/master" when defining the I2C terminology. This sets the
base for further improvements to inclusive language within the Linux
Kernel. The other patches are improvements found on the way.

Changes since v1:
* patch 5 added explaining 'remote' and 'local' targets
* added tags from Easwar to patches 1-3
* rebased to 6.10-rc3


Wolfram Sang (6):
  docs: i2c: summary: start sentences consistently.
  docs: i2c: summary: update I2C specification link
  docs: i2c: summary: update speed mode description
  docs: i2c: summary: document use of inclusive language
  docs: i2c: summary: document 'local' and 'remote' targets
  docs: i2c: summary: rephrase paragraph explaining the figure

 Documentation/i2c/i2c_bus.svg | 15 +++++----
 Documentation/i2c/summary.rst | 62 +++++++++++++++++++++--------------
 2 files changed, 46 insertions(+), 31 deletions(-)

-- 
2.43.0

