Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB202ED87C;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=pu5YAayD5oynjHK0QZRfjoS9Cz5QRTF+Z7fGtjE4LCsJoHycmZ9DKNCmNGQQjWumwbBxK0zefX+U6IdMWVoVJGl7D6spvxm64//W6nu2lg2EiQV7DcGXaSnFicbS6c/U2yRFFB9Wc17NrvwQRa7/Ov7/41njUHDwvkYlwzHc3FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=mPoXsykZwoJHu81axukvCM9Wxj8onSTSnhXLGIOaGNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F/u7A4XgA26PWYhE65bRmUz9QSxNf4VC79xh3YvPhfUoydamwrBuhlvlQZ72U9IRJmn2r/I4sJ4XYOywCCl1YpFb1GmbBzojgi5lnJzv2S6k7CIEgiq7YfpE/3jHlFe9AhKarhe5apzp3K95ZYLvLmMtwnMaWHHPjOCAAiALR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjFUlCI1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjFUlCI1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34571C2BCB4;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=mPoXsykZwoJHu81axukvCM9Wxj8onSTSnhXLGIOaGNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MjFUlCI1Mw5pv+EGdE0j/yKQRUz0sO+yCxNt64Au8vRv/dd8vnGj9reI/DXoTNxXM
	 djlzO1jTt8XhmZi2OiHK3SI6oKCAiTmjRYFYMKOf/F1zjw3bKFLmZLJLcPil7mTTbw
	 OYYOvS6eblNTS5xKIGEHRodhNUh79xmW6jnwtz5BscN5fAtY26XZRrWvv3UMQU3PvF
	 Fk9MagOsRuy2or/gcXOO8N8NpL5bQ0vADAlIuoITs+pLkDyqIEI4PTEShV4YBEmXh5
	 MEXXhPN58zQRjoEq0mbehJlHfqaRsFtdzGaM1y1zfuXGGtqqr+osqJU3YgR7O4qha9
	 zlq52Urr1s9yQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j1c-0nsu;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 04/25] docs: enable Sphinx autodoc extension to allow documenting python
Date: Mon, 19 Jan 2026 17:23:07 +0100
Message-ID: <29cbe375dc418d6fa5793f55199799b5b52dcd38.1768838938.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768838938.git.mchehab+huawei@kernel.org>
References: <cover.1768838938.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Adding python documentation is simple with Sphinx: all we need
is to include the ext.autodoc extension and add the directories
where the Python code sits at the sys.path.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index f0367c48adc6..8e786fe6007f 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -19,6 +19,10 @@ kern_doc_dir = os.path.dirname(os.path.abspath(__file__))
 # Add location of Sphinx extensions
 sys.path.insert(0, os.path.join(kern_doc_dir, "sphinx"))
 
+# Allow sphinx.ext.autodoc to document files at tools and scripts
+sys.path.append(os.path.join(kern_doc_dir, "..", "tools"))
+sys.path.append(os.path.join(kern_doc_dir, "..", "scripts"))
+
 # Minimal supported version
 needs_sphinx = "3.4.3"
 
@@ -152,6 +156,7 @@ extensions = [
     "maintainers_include",
     "parser_yaml",
     "rstFlatTable",
+    "sphinx.ext.autodoc",
     "sphinx.ext.autosectionlabel",
     "sphinx.ext.ifconfig",
     "translations",
-- 
2.52.0

