Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3CE3191BD;
	Fri,  2 Jan 2026 20:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767384420; cv=none; b=D33WWz28F1rjzhXbGBsKclY05vmcWispWwf9Yl27TMtPY8mS/U57ahnPPxigvdfRk0GZU6OckAqD9ICvekCCJFMHd4D5ItgO/ocCFdaRwFsIDMQjRUhvjvgcTIiNkAuBuhQkEpPo+Y3Ung7IIO3b8XZ3MrLVnWtAfimMknnsLN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767384420; c=relaxed/simple;
	bh=OCW8rSi9LmC+ErObyEYHBSeUnrtL4wMZR6ZVEaO6ZKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T1AEm5EpwqHqtVmYw6XnCCphVfdFy4yJZBNv2AmAxDE/995mx1pLQA5vrNCUhps7ITPSTE1jYXJVjCTTdQXMkrRXrniUL13JsKkZPGOGjCpGYoKIlXjGHD+13Tuks2OJAqPX9d/xFWSlUm2RCJSRPG6ki9Ep8ITyUA/1bpJgDDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=D+nw2L7E; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="D+nw2L7E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=pckAoom6GvzdRgYlwsAg43sKAO9vqLuuoe6zx8TgAmA=; b=D+nw2L7EuBhQuOMxw8j3BHACPO
	butMa+iQl70rtP7CfNx5XZ6NAFLIW199vk16+QgHZt2xxFw3oR+wves6WPO321JUA5S5L4AkCsQmO
	4NmhPhPLF3PZYLxgxBjzVVLLYciibfufm5lR+QYwSQpWTIwiqCjAHZtTIiE/dVdq9Yvo4lUFlAfS2
	H6F/qBxgE2eCJz8mKvk6y6V6OJLjHBGZl82JAn10h1k2PPxwjIa0zUnVe5/++kVgal55vRd39X2/x
	W8dgx+n6rM0fPNBUwJ8sqBWsvz2J0jhxYsQBqmzCY5+bUfLB29s+/Spx2Z+XRwPEtg32ZUOLeW5dg
	jwp2lMhA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblQI-00000008gyI-0QEj;
	Fri, 02 Jan 2026 20:06:58 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] docs: find-unused-docs.sh: fixup directory usage
Date: Fri,  2 Jan 2026 12:06:57 -0800
Message-ID: <20260102200657.1040234-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent move of this script from scripts/ to tools/docs/
did not account for the 'cd' directory usage.
Update "cd .." to "cd ../.." to make the script self-correcting.

This also eliminates a shell warning:
./tools/docs/find-unused-docs.sh: line 33: cd: Documentation/: No such file or directory

Fixes: 184414c6a6ca ("docs: move find-unused-docs.sh to tools/docs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: correct subject line typos (2) (arg, kbd error!)

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org

 tools/docs/find-unused-docs.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20251219.orig/tools/docs/find-unused-docs.sh
+++ linux-next-20251219/tools/docs/find-unused-docs.sh
@@ -28,7 +28,7 @@ if ! [ -d "$1" ]; then
 fi
 
 cd "$( dirname "${BASH_SOURCE[0]}" )"
-cd ..
+cd ../..
 
 cd Documentation/
 
