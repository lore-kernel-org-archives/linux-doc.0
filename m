Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B5F4C33FE
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 17:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580528; cv=none; b=Mz79ojWo8c05qKrRJrwuvKKK5Xd0n1G5SRcd38YYgPP762UM0AmWvHd97Yi0JJ6MXIqz6A5GA3HEcdRqBzZp6rCI2A4JNCd1EhCJyOpIDF/oIHIUuITlxk+1Ve9JE/E6yqQTNxtXeryflfjqsZyYkis3YpRpmCVzDCn/SsIBVOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580528; c=relaxed/simple;
	bh=KF/m04HEnR2/PaQ8TRHtgSBXu35zYjk/C4eIqb7Jm4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W2qqAn8kYt/IGhQ75oqYSwqi0SfU1BkaUYrYE6EV7Q7tISDMQgI2dz3pj9gwXxtoTPmdWm7PCZ21/9k4tBR93PPx2lew5JSzNYPlIhDIKjDHLBtg04w86jih0Ku9gij3N4u0DuWjAwFavF4opZF0yq4vkvWgXSlPUTgnINv2HDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPJ2soOl; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPJ2soOl"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c0776592e3so766879b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 10:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580502; x=1790185302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLHPV8c8/fHMdiL9m0WUyLfW2VF9q/3uECZEuCW83Ag=;
        b=nPJ2soOlTzcKvHZ1gp3wnWHgMUnnfCLgO+wN4Nmhv4gF7bXBLsOzdZeNJSDbreigqc
         cqiURS7Ab++brcoXIkrwgow8DDJykUGW1THDGxSWiZ+cs3NAer2+lOfSwXg2uiErXK1Y
         0dMRWk40ShXh6oz2eBeAoQjcnTyPkEO7n85iG6SFPNnPwacEm5z+UP+8F8k416CdCHLG
         HbPFmNIEyWBECfjRGJqFaW+sCcr42bAeIbLcgJuDzS144htStEaTJdBbEW8I0qWDOyCi
         /mf2FudKxIjMj1YafFW/b3jA2MgDUrkcygqoBjLb2/3MvJbca6mIGY6v4q7FyyJTUStm
         uKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580502; x=1790185302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLHPV8c8/fHMdiL9m0WUyLfW2VF9q/3uECZEuCW83Ag=;
        b=xpJbxRSOU32saHsgjElDTUNDU/gv/m5gQ234qFGE1A3GDZx0ZWk9kQMXX3bfskAe8R
         9sw62P3Gs8Gixm3rdlUYzh0tBNxlJbjbWU6+B4VY8MqaiB0JykizdmVR7R4QcKOYZAJu
         HrliJoKzE/GOfYWenCNa+gbhX7x/FFyA48kfZU9KwIvkhLvt6GICzhGb/QCr7TroQepb
         wkV7D6wcGlj2MlU/9LmILt7tumxTzybVKHchP2lrrOtNZBWSDPqQAzfPGVpfzkDnp0WE
         TpfiaceTmdg2A7BCesP3MfHfZg0fEZ+dfskYbUd3bRO7eIthbkO+dcAFB5fBpicoDQrx
         lmtA==
X-Gm-Message-State: AFuF++ki0cRmEQzvVsGBU/bWFVwRdnM1vtz+bV5XRMwNWwPzf7RtH3rZ
	Pcp8wRkTy8by/8nMBfWoTVZiMgC45NikYdeKvtOM9VsH91EjNiZVL/nk0QGByR/iruk=
X-Gm-Gg: AYBFou0lh5Fu5SyVjS+mWhdO5YiQWPjXxNGIh4WjkRHkZENOfpp1fu198EnzuQ5EucO
	LDdu5eG2vT1MzRVYHnHStlrTru8ePSC9K4PyTr4sF8Hd2peZ2VlttKIiGeJ6GH6XaOs7hqie+JR
	kq37qnEPYWX+QdtyJVpDqjobV1n/lmDxAGeSRXi4Sh7JfePEyf34UCO8tvHiI/OhXmyC2fPyyl8
	fkmGymML92zRe22AHWVhhbzTHemrl0+l7eyo/amYakmIpcCPq4533r7OzrKQiYtt87U8JUzAYeg
	pGw8VojNGxg02mIonJR8oVmkPSzTcxVdO92dLMlahDB/W7XOSeQ1Y4TZba4df1MpfIBCBJIIFml
	yAmvyGCibaTQdtqBCe5TkNIuBvfC8d2pMHWzwoA5K3chQbFfvyJXVQaNw8KcMHkG+Gh+TOZG+pC
	iH5iekM35htCMWW2TToJO1NkI12Ho4yHJvrvzU6SeWtMCsXi5PQgJVtPePKOqB2ETkw11Dyz2Oy
	bfbRGLvoPksGiXybKgboI4b67ErZSKz+9XVslM7dYdeuq//SWypxOK4qG9vLkqzbEwaIlYITJ42
	SRGACeRMUaEcIuj+Q4Gr6bxFLU5WgWiMosEH9/DOzI+Fo9A=
X-Received: by 2002:a05:6808:1245:b0:4be:282:6f7a with SMTP id 5614622812f47-4ca4c6baba9mr3582860b6e.40.1789580501875;
        Wed, 16 Sep 2026 10:41:41 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d9999e8sm360668b6e.17.2026.09.16.10.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:41:41 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH 0/5] docs: translations: pt_BR: fix refs and start admin-guide
Date: Wed, 16 Sep 2026 14:41:30 -0300
Message-ID: <20260916174136.48011-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series has two parts.

Patches 1 and 5 fix cross-references across the existing pt_BR
translation.  Several documents pointed at the English version of files
that are already translated, so a reader of the translation was sent
back to the original.  In code-of-conduct.rst and cve.rst the effect was
visible in the rendered text, which quoted the English title of the
referenced document in the middle of a Portuguese sentence.  Nine pt_BR
anchors were missing and are added here; other translations already
define their own.  References whose target has no pt_BR translation are
left pointing at the English document.

Patches 2 to 4 start the admin-guide translation.  The index mirrors the
section layout of the original and lists the pending documents under a
Todolist marker, the same way zh_CN tracks its own, so that entries move
into a toctree as they get translated.  README.rst and devices.rst are
the first two documents.  For devices.rst the device registry itself is
pulled in with a literal include of the original devices.txt, keeping
the numbers in a single place.

The series was built with "make htmldocs" and produces no new warnings;
in particular there is no undefined label and no broken toctree entry.
checkpatch is clean apart from the usual "does MAINTAINERS need
updating?" advisory on the new files, which is already covered by
F: Documentation/translations/pt_BR/.

Daniel Pereira (5):
  docs: translations: pt_BR: point refs at the translated documents
  docs: translations: pt_BR: add admin-guide index
  docs: translations: pt_BR: translate admin-guide/README.rst
  docs: translations: pt_BR: translate admin-guide/devices.rst
  docs: translations: pt_BR: point howto.rst at the translated documents

 .../translations/pt_BR/admin-guide/README.rst | 382 ++++++++++++++++++
 .../pt_BR/admin-guide/devices.rst             | 278 +++++++++++++
 .../translations/pt_BR/admin-guide/index.rst  | 190 +++++++++
 Documentation/translations/pt_BR/index.rst    |  10 +
 .../pt_BR/process/adding-syscalls.rst         |   2 +-
 .../pt_BR/process/applying-patches.rst        |   2 +
 .../code-of-conduct-interpretation.rst        |   2 +
 .../pt_BR/process/code-of-conduct.rst         |   4 +-
 .../pt_BR/process/coding-style.rst            |   2 +
 .../translations/pt_BR/process/cve.rst        |   4 +-
 .../pt_BR/process/development-process.rst     |   2 +
 .../translations/pt_BR/process/howto.rst      |  19 +-
 .../pt_BR/process/kernel-docs.rst             |   2 +
 .../pt_BR/process/license-rules.rst           |   2 +
 .../pt_BR/process/maintainer-handbooks.rst    |   4 +-
 .../pt_BR/process/maintainer-kvm-x86.rst      |   4 +-
 .../process/maintainer-soc-clean-dts.rst      |   5 +-
 .../pt_BR/process/management-style.rst        |   9 +-
 .../pt_BR/process/security-bugs.rst           |  25 +-
 .../pt_BR/process/submit-checklist.rst        |   4 +-
 .../pt_BR/process/submitting-patches.rst      |   2 +
 21 files changed, 918 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/README.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/devices.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/index.rst

-- 
2.47.3

