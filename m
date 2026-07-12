Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD2333A708;
	Sun, 12 Jul 2026 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868456; cv=none; b=fdEJz1hyV0olcJO64bl/vyjreEWoKDOLsPuqeJw6Nly+Ahrv16+Zomqi4OXy93vVK/iap/InXxAl3Caoqf7lyhDqo29x28PThqxx/X1NyyJpgUc5VlO8tPPlZ01mXo7g8Qj5tvtIY1yPeTB+F3A9xmX3iOcXKhUpexfm1zzgWHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868456; c=relaxed/simple;
	bh=gey0uTPa+aj8w7FZkkxBOLbD+VZYX6x0DCUUqQvORZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ngFCSLzkkt7V/yTdPthLFlV9VWPzGCCRbKuCfUilLqCQkCmlB2LoMLJTILCl34gUcRSS36nNny84zsX2Lbs7Py+sM1irvfJaRDQVS7LMYaJ8ZoBgw8hqY2U56NyhhN8Yi2XpBGABB7IvI82tYHDU48XTViod9AXlC7ydkWuS3dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLxzHDi2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLxzHDi2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6A51F000E9;
	Sun, 12 Jul 2026 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783868454;
	bh=t/LFr3+Gj9o97JmZCl7mK4mXvU/1eyDTt45QrUC+hqY=;
	h=From:To:Cc:Subject:Date;
	b=YLxzHDi2t8ijUUtF7n3oVS2pbANjx6PIDRYNKTxGHES1wHkNz5d3lXbdZNBlXSA81
	 GoY5vAIHK983M6Qfhm/T59BjioeMDCUmIuCXudpMVE3WXSsdNNptFKEp8gemyRxIX4
	 gBq4prHN5oMHqGbDARo6kP9+qRgJrAeYDjn5bipHJjZWdRVueTkDQmpHasQJgMQFgt
	 LBiEKlCQ/cC/iIEMSdqYLDhYB/KISpyLuuxT8nVdUjy5sw9a3caapZ0Y5Ns6+8RVum
	 oujtQmrYzPa3VLklM2W6TPFTAfibCIYDSKT+fBmCJcQ3N/yXCmixlIrf1lXcf9gq1/
	 3KqpnbLlXKf5g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wivfo-00000003j0u-35Ho;
	Sun, 12 Jul 2026 17:00:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH 0/2] A couple of fixes for maintainers_include.py
Date: Sun, 12 Jul 2026 16:59:38 +0200
Message-ID: <cover.1783868309.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

It follows a couple fixes for maintainers_include when generating
maintainer's profile entries.

Regards,
Mauro

Mauro Carvalho Chehab (2):
  docs: maintainers_include: don't output duplicated profile entries
  docs: maintainers_include.py: output subsystem name if available

 Documentation/sphinx/maintainers_include.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

-- 
2.55.0

