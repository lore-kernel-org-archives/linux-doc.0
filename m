Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A4E388
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 00:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Greylist: delayed 391 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 10 Oct 2023 17:52:31 PDT
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78B292
	for <linux-doc@vger.kernel.org>; Tue, 10 Oct 2023 17:52:31 -0700 (PDT)
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 55698160303;
	Wed, 11 Oct 2023 00:45:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id 0231720026;
	Wed, 11 Oct 2023 00:45:56 +0000 (UTC)
Message-ID: <f19f55f13682a6c019be2a67e4acb07e94e103f3.camel@perches.com>
Subject: Re: [PATCH v3] Documentation/process/coding-style.rst: space around
 const
From: Joe Perches <joe@perches.com>
To: Max Kellermann <max.kellermann@ionos.com>, linux@roeck-us.net, 
	gregkh@linuxfoundation.org, Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 10 Oct 2023 17:45:55 -0700
In-Reply-To: <20231010125832.1002941-1-max.kellermann@ionos.com>
References: <20231010125832.1002941-1-max.kellermann@ionos.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 0231720026
X-Stat-Signature: ftb4aswraeg9ufnzdw15mwoboyoeo934
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX181EpPdpemFZmpY9nkwWDJH0zZmsZ2ZaUo=
X-HE-Tag: 1696985156-390945
X-HE-Meta: U2FsdGVkX184/p56Wz98aBmu/bGpEMuwN80kbPn/OzGG3c3XICAqYEdACsIuzDe2ZcHe5izk65H1HKz0dIFU+9BSRd/Xnl6fg8RjVoe+Gng81t6pZob0I15wXzBvD4hAkVAQi5rFcyaPuXzRw+cXqFReXvaNJZoE1X9+u0VQ12qlIFsDcz9jw1nTz3fZndLRI1YaB/04BRFE7NUxb56mmykOq7BrUhoPpRTo134fiJPaovV328+1p0IAPnYJs3MKKDCv+5LALwt7EYQk6hL/+ucadioG/j7W5yW4YWL+LaN8iu47kat1/018I8c8aN5R
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, 2023-10-10 at 14:58 +0200, Max Kellermann wrote:
> There are currently no rules on the placement of "const", but a recent
> code submission revealed that there is clearly a preference for spaces
> around it.
>=20
> checkpatch.pl has no check at all for this; though it does sometimes
> complain, but only because it erroneously thinks that the "*" (on
> local variables) is an unary dereference operator, not a pointer type.
>=20

Maybe something like this for checkpatch:
---
 scripts/checkpatch.pl | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 25fdb7fda1128..48d70d0ad9a2b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4726,6 +4726,16 @@ sub process {
 			}
 		}
=20
+# check for const* and *const uses that should have space around const
+		if ($line =3D~ /(?:const\*|\*const)/) {
+			if (WARN("CONST_POINTER",
+				 "const pointers should have spaces around const\n" . $herecurr) &&
+			    $fix) {
+				$fixed[$fixlinenr] =3D~ s/\*const\b/* const/g;
+				$fixed[$fixlinenr] =3D~ s/\bconst\*/const */g;
+			}
+		}
+
 # check for non-global char *foo[] =3D {"bar", ...} declarations.
 		if ($line =3D~ /^.\s+(?:static\s+|const\s+)?char\s+\*\s*\w+\s*\[\s*\]\s*=
=3D\s*\{/) {
 			WARN("STATIC_CONST_CHAR_ARRAY",

