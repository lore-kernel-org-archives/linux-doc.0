Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E073AB281
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 23:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777850917; cv=none; b=FQpXW6Gv4Sve1QFChqN07fcrMgYT0FQpZaQ/Gra/RzRRLXRSbVuR5SuBnzce3Xv59Ex2Gg8SuQrcEh++5djPOl/L+uFCsOei3Pp+567/j6qFLaQC97jAo4y7U81VSPBSFA8ekY7stP4ZO7qfHFn45IzkgPCgNBvEx8uQxwEpmGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777850917; c=relaxed/simple;
	bh=7cca2rlRT7ACx+N96BdZCH12vN3Gv/TDU77qvI/afj8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LUIqiCGY9k5V05htx1iW7NEGtIC6HZamIc6Kmqfjk1dXaQ4yV3KZMTl6adQncG/IsbltGeMS0aumxPS8sLX8rcEec/GxlCzjUO/o/LUn1ngoXzFS5cqNVcTiqNTtpW8RDaD2nxeMgY4zKz7IXuFfi19cnIvgrn983+Xm2BfDiug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=PTJhgSLV; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="PTJhgSLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1777850905; x=1778110105;
	bh=Zfu9oM8VTsUF8ddcd2C5fVFFqpbR7NrpcO5PGYAE5MA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PTJhgSLVHGSmIgZz46oeUVVXVM+jHPV5/9MttNjD/dmYR/1rS25fJSydclILC1kpz
	 5j0Q9jBjjyBdUkbVNfx94VvrP6UA+0mj6kzKvgKj6e1lJYBuhoPbAx0m6pRxpChTBO
	 a27ByN0dqYZzWPJz8nUJUsHvOcxh5NJkCN8NnJ8FO8nYJfVw31UtFkCV4zHysV83nC
	 VymTy66HMXSz/M0F+wzUGMesq3MiMGEii5mjR8K9+a7qrqNQs8KLjwp+0OjOEcRu2D
	 EDLpQvH5PdrKtvpBWLX2y3aeWh5EwI3cEkp0VQqkCIBLq511hsIkC/bqKFYF4TwNFe
	 Z2FLHrNvn0cyQ==
Date: Sun, 03 May 2026 23:28:21 +0000
To: Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet <corbet@lwn.net>
From: Felipe Matarazzo <felipemps@protonmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Matarazzo <felipemps@protonmail.com>
Subject: [PATCH] docs: fix typos in reporting-issues.rst
Message-ID: <20260503232816.70687-1-felipemps@protonmail.com>
Feedback-ID: 9620817:user:proton
X-Pm-Message-ID: 402cf3779ec562d2c9270594ca0d315bd4f276c7
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix 33 typos: wrong words (want=E2=86=92what, is=E2=86=92if/it, sent=
=E2=86=92send,
abound=E2=86=92about, exiting=E2=86=92existing, option=E2=86=92opinion, and=
=E2=86=92an),
missing words (of, a, too, s), extra words (on, over), wrong
word forms (built, stops, advice, severity, lists, types,
Inquiries, requests) and garbled phrases.

Signed-off-by: Felipe Matarazzo <felipemps@protonmail.com>
---
 .../admin-guide/reporting-issues.rst          | 62 +++++++++----------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation=
/admin-guide/reporting-issues.rst
index 16a66a1f1975..2a1998277a1e 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -129,7 +129,7 @@ After these preparations you'll now enter the main part=
:
    situations; during the merge window that actually might be even the bes=
t
    approach, but in that development phase it can be an even better idea t=
o
    suspend your efforts for a few days anyway. Whatever version you choose=
,
-   ideally use a 'vanilla' build. Ignoring these advices will dramatically
+   ideally use a 'vanilla' build. Ignoring this advice will dramatically
    increase the risk your report will be rejected or ignored.
=20
  * Ensure the kernel you just installed does not 'taint' itself when
@@ -302,7 +302,7 @@ Make sure you're using the upstream Linux kernel
=20
 Like most programmers, Linux kernel developers don't like to spend time de=
aling
 with reports for issues that don't even happen with their current code. It=
's
-just a waste everybody's time, especially yours. Unfortunately such situat=
ions
+just a waste of everybody's time, especially yours. Unfortunately such sit=
uations
 easily happen when it comes to the kernel and often leads to frustration o=
n both
 sides. That's because almost all Linux-based kernels pre-installed on devi=
ces
 (Computers, Laptops, Smartphones, Routers, =E2=80=A6) and most shipped by =
Linux
@@ -402,7 +402,7 @@ Issue of high priority?
=20
 Linus Torvalds and the leading Linux kernel developers want to see some is=
sues
 fixed as soon as possible, hence there are 'issues of high priority' that =
get
-handled slightly differently in the reporting process. Three type of cases
+handled slightly differently in the reporting process. Three types of case=
s
 qualify: regressions, security issues, and really severe problems.
=20
 You deal with a regression if some application or practical use case runni=
ng
@@ -422,7 +422,7 @@ happens. That's for example the case when a Linux kerne=
l corrupts the data it's
 handling or damages hardware it's running on. You're also dealing with a s=
evere
 issue when the kernel suddenly stops working with an error message ('kerne=
l
 panic') or without any farewell note at all. Note: do not confuse a 'panic=
' (a
-fatal error where the kernel stop itself) with a 'Oops' (a recoverable err=
or),
+fatal error where the kernel stops itself) with an 'Oops' (a recoverable e=
rror),
 as the kernel remains running after the latter.
=20
=20
@@ -457,7 +457,7 @@ should minimize it:
    caused by other software that was updated at the same time. It can also
    happen that a hardware component coincidentally just broke when you reb=
ooted
    into a new kernel for the first time. Updating the systems BIOS or chan=
ging
-   something in the BIOS Setup can also lead to problems that on look a lo=
t
+   something in the BIOS Setup can also lead to problems that look a lot
    like a kernel regression.
=20
=20
@@ -491,7 +491,7 @@ before proceeding.
 Note, you might not be aware that your system is using one of these soluti=
ons:
 they often get set up silently when you install Nvidia's proprietary graph=
ics
 driver, VirtualBox, or other software that requires a some support from a
-module not part of the Linux kernel. That why your might need to uninstall=
 the
+module not part of the Linux kernel. That's why you might need to uninstal=
l the
 packages with such software to get rid of any 3rd party kernel module.
=20
=20
@@ -602,7 +602,7 @@ Linux developers want to fix badly, as such issues are =
even more unwanted than
 regression in the main development branch, as they can quickly affect a lo=
t of
 people. The developers thus want to learn about such issues as quickly as
 possible, hence there is a streamlined process to report them. Note,
-regressions with newer kernel version line (say something broke when switc=
hing
+regressions with a newer kernel version line (say something broke when swi=
tching
 from 5.9.15 to 5.10.5) do not qualify.
=20
=20
@@ -669,7 +669,7 @@ guessed poorly.
 Once you know the driver or subsystem, you want to search for it in the
 MAINTAINERS file. In the case of 'ath10k_pci' you won't find anything, as =
the
 name is too specific. Sometimes you will need to search on the net for hel=
p;
-but before doing so, try a somewhat shorted or modified name when searchin=
g the
+but before doing so, try a somewhat shorter or modified name when searchin=
g the
 MAINTAINERS file, as then you might find something like this::
=20
        QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
@@ -718,7 +718,7 @@ For people that have the Linux sources at hand there is=
 a second option to find
 the proper place to report: the script 'scripts/get_maintainer.pl' which t=
ries
 to find all people to contact. It queries the MAINTAINERS file and needs t=
o be
 called with a path to the source code in question. For drivers compiled as
-module if often can be found with a command like this::
+module it often can be found with a command like this::
=20
        $ modinfo ath10k_pci | grep filename | sed 's!/lib/modules/.*/kerne=
l/!!; s!filename:!!; s!\.ko\(\|\.xz\)!!'
        drivers/net/wireless/ath/ath10k/ath10k_pci.ko
@@ -733,7 +733,7 @@ Pass parts of this to the script::
        netdev@vger.kernel.org (open list:NETWORKING DRIVERS)
        linux-kernel@vger.kernel.org (open list)
=20
-Don't sent your report to all of them. Send it to the maintainers, which t=
he
+Don't send your report to all of them. Send it to the maintainers, which t=
he
 script calls "supporter:"; additionally CC the most specific mailing list =
for
 the code as well as the Linux Kernel Mailing List (LKML). In this case you=
 thus
 would need to send the report to 'Some Human <shuman@example.com>' with
@@ -762,7 +762,7 @@ as the reporter. That's why you should search for exist=
ing report again, now
 that you know where they need to be reported to. If it's mailing list, you=
 will
 often find its archives on `lore.kernel.org <https://lore.kernel.org/>`_.
=20
-But some list are hosted in different places. That for example is the case=
 for
+But some lists are hosted in different places. That for example is the cas=
e for
 the ath10k WiFi driver used as example in the previous step. But you'll of=
ten
 find the archives for these lists easily on the net. Searching for 'archiv=
e
 ath10k@lists.infradead.org' for example will lead you to the `Info page fo=
r the
@@ -795,13 +795,13 @@ Install a fresh kernel for testing
     situations; during the merge window that actually might be even the be=
st
     approach, but in that development phase it can be an even better idea =
to
     suspend your efforts for a few days anyway. Whatever version you choos=
e,
-    ideally use a 'vanilla' built. Ignoring these advices will dramaticall=
y
+    ideally use a 'vanilla' build. Ignoring this advice will dramatically
     increase the risk your report will be rejected or ignored.*
=20
 As mentioned in the detailed explanation for the first step already: Like =
most
 programmers, Linux kernel developers don't like to spend time dealing with
 reports for issues that don't even happen with the current code. It's just=
 a
-waste everybody's time, especially yours. That's why it's in everybody's
+waste of everybody's time, especially yours. That's why it's in everybody'=
s
 interest that you confirm the issue still exists with the latest upstream =
code
 before reporting it. You are free to ignore this advice, but as outlined
 earlier: doing so dramatically increases the risk that your issue report m=
ight
@@ -814,7 +814,7 @@ In the scope of the kernel "latest upstream" normally m=
eans:
    kernels') are unsuitable at this point of the process. The next subsect=
ion
    explains all of this in more detail.
=20
- * The over next subsection describes way to obtain and install such a ker=
nel.
+ * The subsection after that describes a way to obtain and install such a =
kernel.
    It also outlines that using a pre-compiled kernel are fine, but better =
are
    vanilla, which means: it was built using Linux sources taken straight `=
from
    kernel.org <https://kernel.org/>`_ and not modified or enhanced in any =
way.
@@ -848,7 +848,7 @@ That's why it might make sense to wait till the merge w=
indow is over. But don't
 to that if you're dealing with something that shouldn't wait. In that case
 consider obtaining the latest mainline kernel via git (see below) or use t=
he
 latest stable version offered on kernel.org. Using that is also acceptable=
 in
-case mainline for some reason does currently not work for you. An in gener=
al:
+case mainline for some reason does currently not work for you. And in gene=
ral:
 using it for reproducing the issue is also better than not reporting it is=
sue
 at all.
=20
@@ -861,7 +861,7 @@ hard or risky for backporting; reporting the issue agai=
n hence is unlikely to
 change anything.
=20
 These aspects are also why longterm kernels (sometimes called "LTS kernels=
")
-are unsuitable for this part of the reporting process: they are to distant=
 from
+are unsuitable for this part of the reporting process: they are too distan=
t from
 the current code. Hence go and test mainline first and follow the process
 further: if the issue doesn't occur with mainline it will guide you how to=
 get
 it fixed in older version lines, if that's in the cards for the fix in que=
stion.
@@ -870,8 +870,8 @@ How to obtain a fresh Linux kernel
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 **Using a pre-compiled kernel**: This is often the quickest, easiest, and =
safest
-way for testing =E2=80=94 especially is you are unfamiliar with the Linux =
kernel. The
-problem: most of those shipped by distributors or add-on repositories are =
build
+way for testing =E2=80=94 especially if you are unfamiliar with the Linux =
kernel. The
+problem: most of those shipped by distributors or add-on repositories are =
built
 from modified Linux sources. They are thus not vanilla and therefore often
 unsuitable for testing and issue reporting: the changes might cause the is=
sue
 you face or influence it somehow.
@@ -935,7 +935,7 @@ Check 'taint' flag
 As outlined above in more detail already: the kernel sets a 'taint' flag w=
hen
 something happens that can lead to follow-up errors that look totally
 unrelated. That's why you need to check if the kernel you just installed d=
oes
-not set this flag. And if it does, you in almost all the cases needs to
+not set this flag. And if it does, you in almost all cases need to
 eliminate the reason for it before you reporting issues that occur with it=
. See
 the section above for details how to do that.
=20
@@ -973,7 +973,7 @@ the same time try to keep it as short as possible.
=20
 In this in the previous steps you likely have learned a thing or two about=
 the
 issue you face. Use this knowledge and search again for existing reports
-instead you can join.
+that you can join instead.
=20
=20
 Decode failure messages
@@ -1070,7 +1070,7 @@ interpret, which might render your testing useless. O=
nce you found the major
 version which introduced the regression, feel free to move on in the repor=
ting
 process. But keep in mind: it depends on the issue at hand if the develope=
rs
 will be able to help without knowing the culprit. Sometimes they might
-recognize from the report want went wrong and can fix it; other times they=
 will
+recognize from the report what went wrong and can fix it; other times they=
 will
 be unable to help unless you perform a bisection.
=20
 When dealing with regressions make sure the issue you face is really cause=
d by
@@ -1182,7 +1182,7 @@ few suggestions what often is good to provide:
=20
  * If the issue might be related to your computer hardware, mention what k=
ind
    of system you use. If you for example have problems with your graphics =
card,
-   mention its manufacturer, the card's model, and what chip is uses. If i=
t's a
+   mention its manufacturer, the card's model, and what chip it uses. If i=
t's a
    laptop mention its name, but try to make sure it's meaningful. 'Dell XP=
S 13'
    for example is not, because it might be the one from 2012; that one loo=
ks
    not that different from the one sold today, but apart from that the two=
 have
@@ -1210,7 +1210,7 @@ few suggestions what often is good to provide:
    information. One such tool is ``alsa-info.sh`` `which the audio/sound
    subsystem developers provide <https://www.alsa-project.org/wiki/AlsaInf=
o>`_.
=20
-Those examples should give your some ideas of what data might be wise to
+Those examples should give you some ideas of what data might be wise to
 attach, but you have to think yourself what will be helpful for others to =
know.
 Don't worry too much about forgetting something, as developers will ask fo=
r
 additional details they need. But making everything important available fr=
om
@@ -1247,7 +1247,7 @@ Special handling for high priority issues
 Reports for high priority issues need special handling.
=20
 **Severe issues**: make sure the subject or ticket title as well as the fi=
rst
-paragraph makes the severeness obvious.
+paragraph makes the severity obvious.
=20
 **Regressions**: make the report's subject start with '[REGRESSION]'.
=20
@@ -1386,7 +1386,7 @@ writing something anyway.
 With all these general things off the table let's get into the details of =
how
 to help to get issues resolved once they were reported.
=20
-Inquires and testing request
+Inquiries and testing requests
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 Here are your duties in case you got replies to your report:
@@ -1429,7 +1429,7 @@ your report arrived or had something more important t=
o take care of. When
 writing the reminder, kindly ask if anything else from your side is needed=
 to
 get the ball running somehow. If the report got out by mail, do that in th=
e
 first lines of a mail that is a reply to your initial mail (see above) whi=
ch
-includes a full quote of the original report below: that's on of those few
+includes a full quote of the original report below: that's one of those fe=
w
 situations where such a 'TOFU' (Text Over, Fullquote Under) is the right
 approach, as then all the recipients will have the details at hand immedia=
tely
 in the proper order.
@@ -1474,7 +1474,7 @@ not get solved: the Linux kernel is FLOSS and thus yo=
u can still help yourself.
 You for example could try to find others that are affected and team up wit=
h
 them to get the issue resolved. Such a team could prepare a fresh report
 together that mentions how many you are and why this is something that in =
your
-option should get fixed. Maybe together you can also narrow down the root =
cause
+opinion should get fixed. Maybe together you can also narrow down the root=
 cause
 or the change that introduced a regression, which often makes developing a=
 fix
 easier. And with a bit of luck there might be someone in the team that kno=
ws a
 bit about programming and might be able to write a fix.
@@ -1621,7 +1621,7 @@ guide. Those steps will let you:
  * Check if the kernel developers still maintain the Linux kernel version =
line
    you care about.
=20
- * Search the Linux stable mailing list for exiting reports.
+ * Search the Linux stable mailing list for existing reports.
=20
  * Check with the latest release.
=20
@@ -1640,7 +1640,7 @@ Check code history and search for existing discussion=
s
 In a lot of cases the issue you deal with will have happened with mainline=
, but
 got fixed there. The commit that fixed it would need to get backported as =
well
 to get the issue solved. That's why you want to search for it or any
-discussions abound it.
+discussions about it.
=20
  * First try to find the fix in the Git repository that holds the Linux ke=
rnel
    sources. You can do this with the web interfaces `on kernel.org
@@ -1712,10 +1712,10 @@ nature of kernels, Linux' development model, and ho=
w the world uses the kernel:
 * *Bugs often only occur in a special environment.* That is because Linux =
is
   mostly drivers and can be used in a multitude of ways. Developers often =
do not
   have a matching setup at hand -- and therefore frequently must rely on b=
ug
-  reporters for isolating a problems's cause and testing proposed fixes.
+  reporters for isolating a problem's cause and testing proposed fixes.
=20
 * *The kernel has hundreds of maintainers, but all-rounders are very rare.=
* That
-  again is and effect caused by the multitude of features and drivers, due=
 to
+  again is an effect caused by the multitude of features and drivers, due =
to
   which many kernel developers know little about lower or higher layers re=
lated
   to their code and even less about other areas.
=20
--=20
2.54.0


