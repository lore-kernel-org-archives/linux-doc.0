Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874382;
	b=vBmXSzeXxHCRqSCupH54wAx5ncI5efRu1gNmoSNSR2AjXQAl2GFbxkTqqiT/Z8IrJxZl
	 3HQErVa2QWv4YBdPagxEIy76FVx0hmS9DhHJCH6sM5mdRC45JHeFYPaIDoTv0R8lR2w+r
	 ez2L6kfnwLXRI0wQU2qZFzVRV1zgwA71SjIUHE3LwvfZPafUudPWvdifbz4fHubKsr4mS
	 9MzlcA3NWG1jghrjAQZ7E8QCl1Aj4oEUopEnRawHB7nE4L1ZeGAIm41BD3CF/n+HGOLDF
	 7svpDfwhU151x5aoZVeMAuwZ3Gms/4GaktbJeenN2IxaJzilTq+3ehfsfW8bEL+ugFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2/XF0CUDnW6R6lIlNke+9b08IY9KYK5NcupSvZbkTSI=;
	b=p6dwnvQT/rE8mHf756zjPu9r9lnrebFTgiHu9Nerq733gkqwVHYokTBC+rm4npWbO1LB
	 oS5Qn4ziAGGuncuVutiq/2DBnnMr+xuAErWL9zPSQxp0b9wQPxxaGErOa/9Yf2MR7oUcZ
	 3IboZHJZGUNhwzyTzIpDXCUeGvL7QjImMg5Np+oPXNfG7ktkOD0mwUeaAyen2ZAgq9Nh/
	 OoR2WC6o8nXqAeOmAWCBRAsRwbuK9vTiaJCHvPvZA5EDiYTqveZOzbQTcoaznWZIgSKtN
	 oxYNXVi+p9OK7SlPAoa4hQCM4DEs4hbEagpxW3jCun4o4G/uubB6Ck94dGFc5/EBCiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ny7DlEzb;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD30606A324
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 20:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD30606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ny7DlEzb
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-369f33df08eso424739eec.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792874381; x=1793479181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/XF0CUDnW6R6lIlNke+9b08IY9KYK5NcupSvZbkTSI=;
        b=ny7DlEzbQgSfdcm+uRZCkdg7h1Mda48FRZD2+H4+8WVU2M/FCSc0TIJLapuWetIUGr
         4sT1NIYhx0ZxVJTHeel2FVheuNCPJRFkpBEbleY9t3r+++SAnBG3ffhNZ9CoGjpSREHh
         7rcKE6DWQTEZfC/jLl93u1k3008/GrZ/fMDEqhKEl8SBj3yy1sS2b4MlUl7q/6wuIaBl
         iH4eRMDYYxKP9d10Qex6qIoGVIvEsjGgBnSxO8P/1JRc5U1FCepeWj15kqN44o6t21H2
         C/SuBwFslM/A72KDDSnxSM3Hm7CDjIYZcvaSFZBONNCDCjS09G8GH08PT6Go33T5sonW
         qkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874381; x=1793479181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/XF0CUDnW6R6lIlNke+9b08IY9KYK5NcupSvZbkTSI=;
        b=OV/M2NUsp0g20DLUlPENq3MQwgv94ZMldKcPIlPu/fRIVWpElwO/axKDr3jvCp/+st
         NsCCPq+FA6KIfwNAdYBpqbxY47CZt0tVpZgE3QLgtCL+WIrux1C6BU0DKBpvJLwuA91P
         VdbrhUlW1E7iifIJiibFKWeKEIG13Pyss3kLjaxyNvmnXMB3H5mre/yGwkNvWS86dOuB
         38Iiw9taZ1DEbY1v5g5e3W1+l55ZV1STYH4cwQubW29QRRMS1CTmdWlplNhFf2XTDPor
         g3z6Y1XHQAIWCXiuFaV0aGhfR0oShb5yoAsc5jT8Naiy+6ssaU2mGEWq18ltOrTEXYhw
         xvBQ==
X-Forwarded-Encrypted: i=1; AKwUvByVdmvvucTjj/hdikiNJVkqkF7jyA6/rIhCnmbU5VRAapElOJqkD7lzBy7kLZ0v3EKywpupboIX1ng=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQKHn7McHPnrycBCvyoOg3AFq3hi67+OuTFSz/yGIQaVzAvey7
	q8rxAHU+OH2XK2LvBi8nM+S1uHOtj0Vf7EkH8m+7Ruqx8c5vok0caIvI
X-Gm-Gg: AYBFou3Tw9nIWZ/hzr4ShOkL/3MkdRO7dtrs+fUumeO1zJYznRUhrNJ9Eq5XeZ9glzV
	8jEMVqDO+yrG95WtDTzteERVbgbY+r5f8naSmcNu/45pnPR6LExsvLNMZZnjaI5K2p0HvSYD6n2
	bMhsQiwBhsmzmRx9qkSpKnKJorUAQZ0ChMS5qze3WG0mNByHzDsckioAKvvfxb4a+MGuPeFErHT
	cI58Ykgrx9VGB0CAgEvZyb0pdY2Y6Msv3ll8UnhiW6NxQ/hmj2xyZOXdCnlPkWfEF5OjpJEU6RL
	RVkK+E6XANJDCkfBe/ek37UqZARyyCESGXeAYmY2goCSu2z6GISpJ3dtLbyeD0752KcL4Hu+DP9
	hX7FL9FBCB0t7BfoQKvcA2W5I2ZO+HicQjFyUO9hw8iv56AW61O9UWBDXveqxPl9csj4P9Zqyb5
	g25l3Q5RNbkkWmTDzDVYqolnxS4T4ij3bNYMeMyo9p/sN3RPUGpNeYyAMmihfq+N3iXslYySto+
	hj5Re9FpNbDp72WG4qFrH/yaR9KdXL6FR2DH67HUWBrvO14HXO+eDUVJJ7XJ+6moNtQw4PvfA0e
	Zz/oaFM=
X-Received: by 2002:a05:7022:b05c:b0:164:ae59:935 with SMTP id a92af1059eb24-199363a338bmr3729020c88.34.1792874380668;
        Sat, 24 Oct 2026 13:39:40 -0700 (PDT)
Received: from [127.0.0.2] ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm9764737c88.14.2026.10.24.13.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:39:40 -0700 (PDT)
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Date: Sat, 24 Oct 2026 13:39:19 -0700
Subject: [PATCH RFC 3/3] selftests/landlock: Test LANDLOCK_ADD_RULE_CREATED
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-landlock-created-rights-v1-3-77c8db3f6bd2@gmail.com>
References: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
In-Reply-To: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, John Ericson <mail@johnericson.me>, 
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Farid Zakaria <farid.m.zakaria@gmail.com>
X-Mailer: b4 0.15.2

Cover the new flag: entries created directly in the directory are
usable while the directory and its existing entries stay unreadable, a
renamed file keeps the rights it had at its source and gains none, a
parent layer covers the files a nested domain creates, an unrelated
domain with the same policy cannot use them, and invalid flag
combinations are rejected.

Assisted-by: LLM
Signed-off-by: Farid Zakaria <farid.m.zakaria@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 227 +++++++++++++++++++++++++++++
 1 file changed, 227 insertions(+)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 7e25a6f6073c..84980d426436 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -2640,6 +2640,233 @@ TEST_F_FORK(layout1, refer_mount_root_deny)
 	EXPECT_EQ(0, close(root_fd));
 }
 
+/* clang-format off */
+#define ACCESS_CREATED ( \
+	ACCESS_RW | \
+	LANDLOCK_ACCESS_FS_MAKE_REG | \
+	LANDLOCK_ACCESS_FS_MAKE_DIR)
+/* clang-format on */
+
+/*
+ * Creates a ruleset where dir_s2d1 plays a shared store: tasks may create and
+ * remove entries in it and use what they create, but not read it otherwise.
+ * dir_s1d1 is a read-write source and dir_s3d1 a source without read access.
+ */
+static int create_created_ruleset(struct __test_metadata *const _metadata)
+{
+	const struct rule rules[] = {
+		{
+			.path = dir_s1d1,
+			.access = ACCESS_RW | LANDLOCK_ACCESS_FS_REFER |
+				  LANDLOCK_ACCESS_FS_REMOVE_FILE,
+		},
+		{
+			.path = dir_s2d1,
+			.access = LANDLOCK_ACCESS_FS_MAKE_REG |
+				  LANDLOCK_ACCESS_FS_MAKE_DIR |
+				  LANDLOCK_ACCESS_FS_REFER |
+				  LANDLOCK_ACCESS_FS_REMOVE_FILE,
+		},
+		{
+			.path = dir_s3d1,
+			.access = LANDLOCK_ACCESS_FS_REFER |
+				  LANDLOCK_ACCESS_FS_REMOVE_FILE,
+		},
+		{},
+	};
+	const int ruleset_fd = create_ruleset(
+		_metadata, ACCESS_CREATED | LANDLOCK_ACCESS_FS_REFER |
+				   LANDLOCK_ACCESS_FS_REMOVE_FILE,
+		rules);
+
+	add_path_beneath(_metadata, ruleset_fd, ACCESS_CREATED, dir_s2d1,
+			 LANDLOCK_ADD_RULE_CREATED);
+	return ruleset_fd;
+}
+
+/* Creates a new regular file and returns 0 or the open(2) errno. */
+static int create_file_at(const char *const path)
+{
+	const int fd = open(path, O_CREAT | O_EXCL | O_WRONLY | O_CLOEXEC, 0700);
+
+	if (fd < 0)
+		return errno;
+	close(fd);
+	return 0;
+}
+
+/*
+ * Checks that entries created directly in a LANDLOCK_ADD_RULE_CREATED
+ * directory are usable, while the directory, its pre-existing entries, and
+ * entries created deeper in pre-existing subdirectories stay inaccessible.
+ */
+TEST_F_FORK(layout1, created_rule)
+{
+	const char *const new_file = TMP_DIR "/s2d1/new";
+	const char *const new_dir = TMP_DIR "/s2d1/newdir";
+	const char *const new_nested = TMP_DIR "/s2d1/newdir/f";
+	const int ruleset_fd = create_created_ruleset(_metadata);
+
+	enforce_ruleset(_metadata, ruleset_fd);
+	ASSERT_EQ(0, close(ruleset_fd));
+
+	/* The directory and its existing entries are not readable. */
+	ASSERT_EQ(EACCES, test_open(dir_s2d1, O_RDONLY | O_DIRECTORY));
+	ASSERT_EQ(EACCES, test_open(file1_s2d1, O_RDONLY));
+	ASSERT_EQ(EACCES, test_open(dir_s2d2, O_RDONLY | O_DIRECTORY));
+
+	/* New entries are usable. */
+	ASSERT_EQ(0, create_file_at(new_file));
+	ASSERT_EQ(0, test_open(new_file, O_RDWR));
+	ASSERT_EQ(0, mkdir(new_dir, 0700));
+	ASSERT_EQ(0, test_open(new_dir, O_RDONLY | O_DIRECTORY));
+	ASSERT_EQ(0, create_file_at(new_nested));
+	ASSERT_EQ(0, test_open(new_nested, O_RDWR));
+
+	/*
+	 * Only direct children of the directory are covered.  The file is
+	 * created before open(2) fails, and the layout teardown expects
+	 * dir_s2d2 to contain only its own files.
+	 */
+	ASSERT_EQ(EACCES, create_file_at(TMP_DIR "/s2d1/s2d2/new"));
+	ASSERT_EQ(0, unlink(TMP_DIR "/s2d1/s2d2/new"));
+}
+
+/*
+ * Checks that a file renamed into a LANDLOCK_ADD_RULE_CREATED directory keeps
+ * the access rights it had at its source and gains none it did not have, by
+ * moving one file from a readable source and one from an unreadable source.
+ */
+TEST_F_FORK(layout1, created_rule_refer)
+{
+	const char *const moved_rw = TMP_DIR "/s2d1/moved_rw";
+	const char *const moved_ro = TMP_DIR "/s2d1/moved_ro";
+	const int ruleset_fd = create_created_ruleset(_metadata);
+
+	enforce_ruleset(_metadata, ruleset_fd);
+	ASSERT_EQ(0, close(ruleset_fd));
+
+	/* Keeps the access rights a file already had at its source. */
+	ASSERT_EQ(0, rename(file1_s1d1, moved_rw));
+	ASSERT_EQ(0, test_open(moved_rw, O_RDWR));
+
+	/* Does not gain access rights a file did not have at its source. */
+	ASSERT_EQ(EACCES, test_open(file1_s3d1, O_RDONLY));
+	ASSERT_EQ(0, rename(file1_s3d1, moved_ro));
+	ASSERT_EQ(EACCES, test_open(moved_ro, O_RDONLY));
+}
+
+/*
+ * Checks that the layer holding the LANDLOCK_ADD_RULE_CREATED rule grants
+ * access to files created by a nested domain, by stacking a permissive layer
+ * and creating the file from within it.
+ */
+TEST_F_FORK(layout1, created_rule_nested_domain)
+{
+	const char *const new_file = TMP_DIR "/s2d1/new";
+	const struct rule rules[] = {
+		{
+			.path = TMP_DIR,
+			.access = ACCESS_CREATED,
+		},
+		{},
+	};
+	const int ruleset_fd = create_created_ruleset(_metadata);
+
+	enforce_ruleset(_metadata, ruleset_fd);
+	ASSERT_EQ(0, close(ruleset_fd));
+	enforce_fs(_metadata, ACCESS_CREATED, rules);
+
+	/* The parent layer grants access to what nested domains create. */
+	ASSERT_EQ(0, create_file_at(new_file));
+	ASSERT_EQ(0, test_open(new_file, O_RDWR));
+	ASSERT_EQ(EACCES, test_open(file1_s2d1, O_RDONLY));
+}
+
+/*
+ * Checks that an unrelated domain with the same policy cannot use a file
+ * another domain created, by keeping the creating child alive while the
+ * parent enforces its own domain and tries to read the file.
+ */
+TEST_F_FORK(layout1, created_rule_other_domain)
+{
+	const char *const new_file = TMP_DIR "/s2d1/new";
+	int pipe_created[2], pipe_done[2], status;
+	pid_t child;
+	char buf;
+
+	ASSERT_EQ(0, pipe2(pipe_created, O_CLOEXEC));
+	ASSERT_EQ(0, pipe2(pipe_done, O_CLOEXEC));
+
+	child = fork();
+	ASSERT_LE(0, child);
+	if (child == 0) {
+		const int ruleset_fd = create_created_ruleset(_metadata);
+
+		ASSERT_EQ(0, close(pipe_created[0]));
+		ASSERT_EQ(0, close(pipe_done[1]));
+
+		enforce_ruleset(_metadata, ruleset_fd);
+		ASSERT_EQ(0, create_file_at(new_file));
+		ASSERT_EQ(1, write(pipe_created[1], ".", 1));
+		ASSERT_EQ(1, read(pipe_done[0], &buf, 1));
+		_exit(_metadata->exit_code);
+	}
+
+	/*
+	 * Closing the unused ends makes a read return if the other process
+	 * fails before writing.
+	 */
+	ASSERT_EQ(0, close(pipe_created[1]));
+	ASSERT_EQ(0, close(pipe_done[0]));
+
+	/* A domain with the same policy can't use what another one created. */
+	ASSERT_EQ(1, read(pipe_created[0], &buf, 1));
+	enforce_ruleset(_metadata, create_created_ruleset(_metadata));
+	ASSERT_EQ(EACCES, test_open(new_file, O_RDONLY));
+	ASSERT_EQ(1, write(pipe_done[1], ".", 1));
+
+	ASSERT_EQ(child, waitpid(child, &status, 0));
+	ASSERT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
+}
+
+/*
+ * Checks that LANDLOCK_ADD_RULE_CREATED is rejected on a file, combined with
+ * LANDLOCK_ADD_RULE_QUIET, or with an empty allowed_access.
+ */
+TEST_F_FORK(layout1, created_rule_invalid)
+{
+	const int ruleset_fd = create_ruleset(_metadata, ACCESS_CREATED, NULL);
+	struct landlock_path_beneath_attr path_beneath = {
+		.allowed_access = ACCESS_RW,
+	};
+
+	path_beneath.parent_fd = open(file1_s1d1, O_PATH | O_CLOEXEC);
+	ASSERT_LE(0, path_beneath.parent_fd);
+	ASSERT_EQ(-1, landlock_add_rule(ruleset_fd, LANDLOCK_RULE_PATH_BENEATH,
+					&path_beneath,
+					LANDLOCK_ADD_RULE_CREATED));
+	ASSERT_EQ(EINVAL, errno);
+	ASSERT_EQ(0, close(path_beneath.parent_fd));
+
+	path_beneath.parent_fd = open(dir_s1d1, O_PATH | O_CLOEXEC);
+	ASSERT_LE(0, path_beneath.parent_fd);
+	ASSERT_EQ(-1, landlock_add_rule(ruleset_fd, LANDLOCK_RULE_PATH_BENEATH,
+					&path_beneath,
+					LANDLOCK_ADD_RULE_CREATED |
+						LANDLOCK_ADD_RULE_QUIET));
+	ASSERT_EQ(EINVAL, errno);
+
+	path_beneath.allowed_access = 0;
+	ASSERT_EQ(-1, landlock_add_rule(ruleset_fd, LANDLOCK_RULE_PATH_BENEATH,
+					&path_beneath,
+					LANDLOCK_ADD_RULE_CREATED));
+	ASSERT_EQ(ENOMSG, errno);
+	ASSERT_EQ(0, close(path_beneath.parent_fd));
+	ASSERT_EQ(0, close(ruleset_fd));
+}
+
 TEST_F_FORK(layout1, refer_part_mount_tree_is_allowed)
 {
 	const struct rule layer1[] = {

-- 
2.55.0

