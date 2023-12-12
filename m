Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ng9xggNY";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="YM4XbS5l";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="r8qTDk+G";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="n3JMvRKN"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8914AFE;
	Tue, 12 Dec 2023 09:21:50 -0800 (PST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE51B1FB77;
	Tue, 12 Dec 2023 17:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702401708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EYeLNxxcRpZBsoYcrMasPjbq5v48kbxiKxQZBxiyMNE=;
	b=ng9xggNYDzAm/v8vqtZGMmLKDskuz7qlLuWHgfqYF1tqpLHRQhXmhUhFQNxTfEcs/BI9vx
	+y8prtl6hH3ojbHkUW4tm7OCCF/LNI5PLUoqoSWmrtGyFBxCnFy4GyGJiJMJgXaobTJ5L+
	J8SGsCU2LRxB6obam1m0YSk/il6tWPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702401708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EYeLNxxcRpZBsoYcrMasPjbq5v48kbxiKxQZBxiyMNE=;
	b=YM4XbS5lkmKbHQVNKll196bMoyPlGmz2ELvMPlffWShv6p6u4OQOeQ2xJuu1jFxRrD234L
	nEy0p6O0P/2gjxCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702401706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EYeLNxxcRpZBsoYcrMasPjbq5v48kbxiKxQZBxiyMNE=;
	b=r8qTDk+GdcbEkYv8KEIw/zD5dtgvE4xb7BhzW3ls/XNQhoEFKqq63m8p7dtkpGzdMEFqJY
	mCKCjLyqbgdfPG4AIPAElSrNt2Byqf/pRl2diFlM/Cj5v0iu42ES8XOSoU5pFnTOPI1ZQC
	63sJybP1cFTNgmhGw9fo4KF+iXA8XYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702401706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EYeLNxxcRpZBsoYcrMasPjbq5v48kbxiKxQZBxiyMNE=;
	b=n3JMvRKNUuh0UZWuqTFyXdpFNaMFZ81h9bnUETg7gj/146SIhjqFosNgK23PZZaaPwzaaw
	AtHOxDvFIkEyoyBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9DC1136C7;
	Tue, 12 Dec 2023 17:21:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jqmsMKqWeGXvOQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 12 Dec 2023 17:21:46 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Tue, 12 Dec 2023 18:21:43 +0100
Subject: [PATCH] Documentation, mm/unaccepted: document accept_memory
 kernel parameter
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231212-accept_memory_param-v1-1-a9012402b887@suse.cz>
X-B4-Tracking: v=1; b=H4sIAKaWeGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDI0Mj3cTk5NSCkvjc1Nz8osr4gsSixFxdk0TzxJRk01RTUwsjJaDOgqL
 UtMwKsKnRsbW1AJp1SqRlAAAA
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
 Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.12.4
X-Spam-Level: 
X-Spam-Score: -1.42
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.40
X-Spamd-Result: default: False [-1.40 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.10)[64.97%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,intel.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

The accept_memory kernel parameter was added in commit dcdfdd40fa82
("mm: Add support for unaccepted memory") but not listed in the
kernel-parameters doc. Add it there.

Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 Documentation/admin-guide/kernel-parameters.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 65731b060e3f..3a4ebb46073c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1,3 +1,13 @@
+	accept_memory=  [MM]
+			Format: { eager | lazy }
+			default: lazy
+			By default, unaccepted memory is accepted lazily to
+			avoid prolonged boot at the cost of some runtime
+			overhead until all memory is eventually accepted. In
+			most cases the overhead is negligible but for some
+			workloads or for debugging purposes accept_memory=eager
+			can be used to accept all memory at once during boot.
+
 	acpi=		[HW,ACPI,X86,ARM64,RISCV64]
 			Advanced Configuration and Power Interface
 			Format: { force | on | off | strict | noirq | rsdt |

---
base-commit: a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
change-id: 20231212-accept_memory_param-4a7adc5e5582

Best regards,
-- 
Vlastimil Babka <vbabka@suse.cz>

